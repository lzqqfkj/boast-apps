# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all 
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b9390e4490b9b2a1ae103cb3c3c75a28'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def windows?  
  	!(RUBY_PLATFORM =~ /win32/).nil?  
  end 
  def set_wap_content_type
    @headers["Content-Type"]= "text/vnd.wap.wml; charset=iso-8859-1"
  end

  protected     
    def owner?  
      if defined?(current_user) and ( not current_user.nil?)   then   
         @current_user.role_id == 99 or @current_user.role_id == 1
      end
    end 
    
    def authorize   
      unless owner?   
        flash[:error] = "unauthorized access"  
        redirec_to new_session_path   
        false  
      end   
    end   

end
