require 'date'

class SeoKeywordsController < ApplicationController
  include AuthenticatedSystem
  
  before_filter :load_company
  def load_company
    @company = Company.find(params[:company_id])
  end
  # GET /seo_keywords
  # GET /seo_keywords.xml
  def index
    @seo_keywords = @company.seo_keywords.find(:all)
    begin
      seocom = SeoCompany.find(@company.id,:conditions =>"updatedat > DATE_SUB(CURDATE(),INTERVAL 6 DAY)" )  
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid seo_company:: #{@company.name}" )
      seocom = nil
    end
    if ( seocom.nil?) 
      @outdated = true
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seo_keywords }
    end
  end

  # GET /seo_keywords/1
  # GET /seo_keywords/1.xml
  def show
    @seo_keyword = @company.seo_keywords.find(params[:id])
#    @results = @seo_keyword.seo_results.find(:all,:conditions => ["t_search_id =?", params[:sid]])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seo_keyword }
    end
  end

  # GET /seo_keywords/new
  # GET /seo_keywords/new.xml
  def new
    @seo_keyword = @company.seo_keywords.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seo_keyword }
    end
  end

  # GET /seo_keywords/1/edit
  def edit
    @seo_keyword = @company.seo_keywords.find(params[:id])
  end

  # POST /seo_keywords
  # POST /seo_keywords.xml
  def create
    @seo_keyword = @company.seo_keywords.build(params[:seo_keyword])

    respond_to do |format|
      if @seo_keyword.save
        flash[:notice] = '关键字添加成功.'
        format.html { redirect_to(company_path(@company)) }
        format.xml  { render :xml => @seo_keyword, :status => :created, :location => @seo_keyword }
      else
        flash[:notice] = '关键字： "'+@seo_keyword.keyword+'"添加失败.'
        format.html {redirect_to(company_seo_keywords_path(@company)) }
        format.xml  { render :xml => @seo_keyword.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seo_keywords/1
  # PUT /seo_keywords/1.xml
  def update
    @seo_keyword = @company.seo_keywords.find(params[:id])

    respond_to do |format|
      if @seo_keyword.update_attributes(params[:seo_keyword])
        flash[:notice] = 'SeoKeyword was successfully updated.'
        format.html { redirect_to([@company,@seo_keyword]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seo_keyword.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seo_keywords/1
  # DELETE /seo_keywords/1.xml
  def destroy
    @seo_keyword = @company.seo_keywords.find(params[:id])
    @seo_keyword.destroy

    respond_to do |format|
      format.html { redirect_to(company_seo_keywords_url(@company)) }
      format.xml  { head :ok }
    end
  end
end
