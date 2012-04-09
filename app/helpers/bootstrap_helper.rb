module BootstrapHelper

  def bootstrap_field(form_builder, field, &block)
    label_html = form_builder.label(field, :class => "control-label") 
    field_html = content_tag(:div, capture(&block), :class => "controls")

    content_tag(:div, label_html + field_html, :class => "control-group")
  end

end
