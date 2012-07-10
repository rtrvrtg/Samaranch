module Paperclip
  module Storage
    module Sftp
      def self.extended base
        require 'net/ssh'
        require 'net/sftp'

        base.instance_eval do
          @host = @options[:sftp_host]
          @user = @options[:sftp_user]
          @password = @options[:sftp_password]
        end
        
        Paperclip.interpolates(:url_root) do |attachment, style|
          "#{attachment.url_root}/#{attachment.path(style).gsub(attachment.path_root, "")}"
        end
      end

      def ssh
        @ssh_connection ||= Net::SSH.start @host, @user, :password => @password
      end

      def exists? style = default_style
        ssh.exec!("ls #{path(style)} 2>/dev/null") ? true : false
      end

      def to_file style = default_style
        @queued_for_write[style] || (ssh.sftp.file.open(path(style) + File.basename(file.path), 'rb') if exists?(style))
      end
      alias_method :to_io, :to_file

      def flush_writes #:nodoc:
        Rails.logger.debug("[paperclip] Writing files for #{name}")
        @queued_for_write.each do |style_name, file|
          Rails.logger.debug(file)
          file.close
          Rails.logger.debug("[paperclip] -> #{File.dirname(path(style_name))}")
          ssh.exec! "mkdir -p #{File.dirname(path(style_name))}"
          Rails.logger.debug("[paperclip] -> #{path(style_name)}")
          ssh.sftp.upload!(file.path, path(style_name))
          ssh.sftp.setstat!(path(style_name), :permissions => 0644)
        end
        @queued_for_write = {}
      end

      def flush_deletes #:nodoc:
        Rails.logger.debug("[paperclip] Deleting files for #{name}")
        @queued_for_delete.each do |path|
          begin
            Rails.logger.debug("[paperclip] -> #{path}")
            ssh.sftp.remove(path)
            FileUtils.rm(path) if File.exist?(path)
          rescue Net::SFTP::StatusException
            # ignore file-not-found, let everything else pass
          end
        end
        @queued_for_delete = []
      end
      
    end
  end
end