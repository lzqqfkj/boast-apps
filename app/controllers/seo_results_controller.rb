class SeoResultsController < ApplicationController
  
  before_filter :load_keyword
  def load_keyword
    @seo_keyword = SeoKeyword.find(params[:seo_keyword_id])
  end

  # GET /seo_results
  # GET /seo_results.xml
  def index
    @seo_results = @seo_keyword.seo_results.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seo_results }
    end
  end

  # GET /seo_results/1
  # GET /seo_results/1.xml
  def show
    @seo_result = @seo_keyword.seo_results.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seo_result }
    end
  end

  # GET /seo_results/new
  # GET /seo_results/new.xml
  def new
    @seo_result = @seo_keyword.seo_results.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seo_result }
    end
  end

  # GET /seo_results/1/edit
  def edit
    @seo_result = @seo_keyword.seo_results.find(params[:id])
  end

  # POST /seo_results
  # POST /seo_results.xml
  def create
    @seo_result = @seo_keyword.seo_results.build(params[:seo_result])

    respond_to do |format|
      if @seo_result.save
        flash[:notice] = 'SeoResult was successfully created.'
        format.html { redirect_to([@seo_keyword, @seo_result]) }
        format.xml  { render :xml => @seo_result, :status => :created, :location => @seo_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seo_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seo_results/1
  # PUT /seo_results/1.xml
  def update
    @seo_result = @seo_keyword.seo_results.find(params[:id])

    respond_to do |format|
      if @seo_result.update_attributes(params[:seo_result])
        flash[:notice] = 'SeoResult was successfully updated.'
        format.html { redirect_to([@seo_keyword, @seo_result]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seo_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seo_results/1
  # DELETE /seo_results/1.xml
  def destroy
    @seo_result = @seo_keyword.seo_results.find(params[:id])
    @seo_result.destroy

    respond_to do |format|
      format.html { redirect_to(seo_keyword_seo_results_url(@seo_keyword)) }
      format.xml  { head :ok }
    end
  end
end
