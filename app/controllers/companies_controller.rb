class CompaniesController < ApplicationController
  include AuthenticatedSystem
  protect_from_forgery :only => :search
#  before_filter :login_required
  # GET /companies
  # GET /companies.xml
  def index
    sql = "SELECT * FROM companies,seo_companies WHERE ( companies.id = seo_companies.id)"
    conditions = " "
    order = " order by companies.created_at desc"
    @flag = false
    if not params[:value].nil?
      if (params[:value][:name] != "")
         conditions = " AND companies.name like '%#{params[:value][:name]}%'"
      end 
      @flag = true
    end
        
    if defined?(current_user) and ( not current_user.nil?)   then
    
      if current_user.role_id == 99 then #管理员 admin_qfcbj 密码cbjcbj
        #@companies = Company.find_by_sql( sql + conditions + order )
      	@companies = Company.find_by_sql( sql + conditions + order ).paginate :page => params[:page]|| session[:cur_companies_page]||1, :per_page => 20
        session[:cur_companies_page]= params[:page]|| session[:cur_companies_page]||1
		    
		    respond_to do |format|
		      format.html # index.html.erb
		      format.xml  { render :xml => @companies }
		    end
      elsif current_user.role_id == 1 then #核心代理商
      
        #@companies = Company.find_by_sql("SELECT * FROM companies,seo_companies WHERE ( companies.id = seo_companies.id) order by companies.created_at desc" )
        #@companies = @companies.paginate :page => params[:page]|| session[:cur_companies_page]||1, :per_page => 20
        #
        # session[:cur_companies_page]= params[:page]|| session[:cur_companies_page]||1
		    #respond_to do |format|
		    #  format.html # index.html.erb
		    #  format.xml  { render :xml => @companies }
		    #end    
		    
    	elsif current_user.role_id == 2 then #代理商 agent_swen 密码 85509088
    	  sql = "SELECT * FROM companies where introducer_id = #{current_user.company.id} "
    	  order = " order by id desc"
    	  @companies = Company.find_by_sql(sql + conditions + order).paginate :page => params[:page]||session[:cur_companies_page]|| 1,:per_page => 20
         session[:cur_companies_page]= params[:page]|| session[:cur_companies_page]||1
		    respond_to do |format|
		      format.html # index.html.erb
		      format.xml  { render :xml => @companies }
		    end   
		    
    	elsif current_user.role_id == 3 then #企业主
      	@company = Company.find_by_id(current_user.company.id)
    	  redirect_to @company     	
      end
      
    else #异常
      redirect_to new_session_path
      
	  end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    begin
      @company = Company.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid company #{params[:id]}" )
      flash[:notice] = "找不到id=#{params[:id]}的公司"
      redirect_to :action => :index
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @company }
      end
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new
    @company.introducer_id = -1
    if [99,1,2,3].include?(current_user.role_id) then #管理员
    	@company.introducer_id = current_user.company.id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])
     @company.introducer_id = -1
     if [99,1,2,3].include?(current_user.role_id) then #管理员
     	@company.introducer_id = current_user.company.id
     end

    respond_to do |format|
      if @company.save
        flash[:notice] = 'Company was successfully created.'
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = 'Company was successfully updated.'
        format.html { redirect_to(@company) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
  
  #show information of GroupPost
  def showinfos
#     @company = Company.find_by_webaddress(params[:webaddress ])
     @company = Company.find(params[:id ])
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
     end
  end
  
  
  def search
    @companies = Company.find_with_sphinx params[:value] ,:order => "id" #, :sphinx => {:width => [100, 100, 50]} #"北京 生态性试验"
    @se_kw = params[:value]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end
end
