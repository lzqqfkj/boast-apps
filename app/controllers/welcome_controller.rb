class WelcomeController < ApplicationController
  #include AuthenticatedSystem
	#before_filter :login_required
  before_filter :set_wap_content_type,:only =>:wap


  def upload
    @company = Company.find(:first)
    respond_to do |format|
      format.html # upload.html.erb
      format.xml  { render :xml => @company }
    end
  end	
  
  def hello
     @title = "San Francisco Sailing Weather"
    respond_to do |format|
      
      format.xml
    end
     #render(:layout => "welcomes")
  end
  
end
