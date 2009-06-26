class TSearchesController < ApplicationController
  # GET /t_searches
  # GET /t_searches.xml
  def index
    @t_searches = TSearch.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @t_searches }
    end
  end

  # GET /t_searches/1
  # GET /t_searches/1.xml
  def show
    @t_search = TSearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @t_search }
    end
  end

  # GET /t_searches/new
  # GET /t_searches/new.xml
  def new
    @t_search = TSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @t_search }
    end
  end

  # GET /t_searches/1/edit
  def edit
    @t_search = TSearch.find(params[:id])
  end

  # POST /t_searches
  # POST /t_searches.xml
  def create
    @t_search = TSearch.new(params[:t_search])

    respond_to do |format|
      if @t_search.save
        flash[:notice] = 'TSearch was successfully created.'
        format.html { redirect_to(@t_search) }
        format.xml  { render :xml => @t_search, :status => :created, :location => @t_search }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @t_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /t_searches/1
  # PUT /t_searches/1.xml
  def update
    @t_search = TSearch.find(params[:id])

    respond_to do |format|
      if @t_search.update_attributes(params[:t_search])
        flash[:notice] = 'TSearch was successfully updated.'
        format.html { redirect_to(@t_search) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @t_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /t_searches/1
  # DELETE /t_searches/1.xml
  def destroy
    @t_search = TSearch.find(params[:id])
    @t_search.destroy

    respond_to do |format|
      format.html { redirect_to(t_searches_url) }
      format.xml  { head :ok }
    end
  end
end
