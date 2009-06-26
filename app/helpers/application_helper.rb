# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def javascript(*files)   
    content_for(:head) { javascript_include_tag(*files) }   
  end   
    
  def stylesheet(*files)   
    content_for(:head) { stylesheet_link_tag(*files) }   
  end
  
#  def javascript(*args)
#    content_for(:head) { javascript_include_tag(*args) }
#  end
  def error_messages_for(object_name, options = {}) 
    options = options.symbolize_keys 
    object = instance_variable_get("@#{object_name}") 
    unless object.errors.empty? 
      error_lis = [] 
      object.errors.each{ |key, msg| error_lis << content_tag("li", msg) } 
      content_tag("div", content_tag(options[:header_tag] || "h2", "发生#{object.errors.count}个错误:" ) + content_tag("ul", error_lis), "id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation" ) 
    end
  end 

end
