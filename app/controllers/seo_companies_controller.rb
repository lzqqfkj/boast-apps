class SeoCompaniesController < ApplicationController
  include AuthenticatedSystem

  # GET /companies
  # GET /companies.xml
  def index

  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
   
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @seo_company = SeoCompany.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seo_company }
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.xml
  def create
    @seo_company = SeoCompany.new

    if not params[:seo_company].nil?
      if params[:seo_company][:name] != ""
        @seo_company.name = params[:seo_company][:name]
      end
      if @seo_company.name != ""
         begin
         	if ( seocom = SeoCompany.find_by_name(@seo_company.name) ).nil?
         	   @com = Company.find(:all,:conditions => [" name =?",@seo_company.name],:order => " created_at desc").first
         	else
         	  if params[:commit].include? "不抓取"
         	    #seocom.destroy
         	    outdate = 7.days.until(Time.now).strftime("%Y-%m-%d %H:%M:%S")
         	    seocom.updatedat = outdate.to_time
         	    seocom.save
         	    flash[:notice] = "【#{@seo_company.name}】已经退出抓取队列！" 
         	    #redirect_to(companies_url)
         	    #redirect_to(company_seo_keywords_url(seocom))
         	  else
         	    seocom.updatedat = Time.now
         	    seocom.save
         	    str = ""
              if seocom.seo_keywords.empty?
                str = "只是它还没有关键字噢！" #+ (params[:commit].include? "过期").to_s
              end 
         	    flash[:notice] = "【#{@seo_company.name}】已经添加到抓取队列！" + str
         	  end
         	  redirect_to(company_seo_keywords_url(seocom))
            return
         	end
         rescue ActiveRecord::RecordNotFound
           logger.error("Attempt to access invalid company #{@seo_company.name}" )
           @com = nil  
           flash[:notice] = "【#{@seo_company.name}】添加失败,请联系管理员！"
           redirect_to(companies_url)
         end
         if (not @com.nil?)
           @seo_company.id = @com.id
           if @seo_company.save 
             str = ""
             if @seo_company.seo_keywords.empty?
               str = "别忘了为它添加关键字噢！"
             end
             flash[:notice] = "【#{@seo_company.name}】已经添加到抓取队列！"+ str 
             redirect_to(company_seo_keywords_url(@seo_company))
           end
         end
      end
    end

  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update

  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @seo_company = SeoCompany.find(params[:id])
    @seo_company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
  
end
