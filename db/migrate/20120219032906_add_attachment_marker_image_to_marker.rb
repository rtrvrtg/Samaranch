class AddAttachmentMarkerImageToMarker < ActiveRecord::Migration
  def self.up
    add_column :markers, :marker_image_file_name, :string
    add_column :markers, :marker_image_content_type, :string
    add_column :markers, :marker_image_file_size, :integer
    add_column :markers, :marker_image_updated_at, :datetime
  end

  def self.down
    remove_column :markers, :marker_image_file_name
    remove_column :markers, :marker_image_content_type
    remove_column :markers, :marker_image_file_size
    remove_column :markers, :marker_image_updated_at
  end
end
