module LayoutHelper
  
  def flash_notice
    html = ''
    flash.each do |name, msg|
      html += content_tag :div, msg, :class => name
    end
    html.html_safe
  end
  
  def selected_if(condition)
    "selected" if condition
  end
  
end