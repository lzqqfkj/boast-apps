class SdatasController < ApplicationController
  include AuthenticatedSystem
  # GET /sdatas
  # GET /sdatas.xml
  def index
    @sdatas = Sdata.find(:all,:order => "sid")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sdatas }
    end
  end

  # GET /sdatas/1
  # GET /sdatas/1.xml
  def show
    @sdata = Sdata.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sdata }
    end
  end

  # GET /sdatas/new
  # GET /sdatas/new.xml
  def new
    @sdata = Sdata.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sdata }
    end
  end

  # GET /sdatas/1/edit
  def edit
    @sdata = Sdata.find(params[:id])
  end

  # POST /sdatas
  # POST /sdatas.xml
  def create
    @sdata = Sdata.new(params[:sdata])

    respond_to do |format|
      if @sdata.save
        flash[:notice] = 'Sdata was successfully created.'
        format.html { redirect_to(@sdata) }
        format.xml  { render :xml => @sdata, :status => :created, :location => @sdata }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sdata.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sdatas/1
  # PUT /sdatas/1.xml
  def update
    @sdata = Sdata.find(params[:id])

    respond_to do |format|
      if @sdata.update_attributes(params[:sdata])
        flash[:notice] = 'Sdata was successfully updated.'
        format.html { redirect_to(@sdata) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sdata.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sdatas/1
  # DELETE /sdatas/1.xml
  def destroy
    @sdata = Sdata.find(params[:id])
    @sdata.destroy

    respond_to do |format|
      format.html { redirect_to(sdatas_url) }
      format.xml  { head :ok }
    end
  end
end
