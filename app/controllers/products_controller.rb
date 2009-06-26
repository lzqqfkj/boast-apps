class ProductsController < ApplicationController
   include AuthenticatedSystem
 
  before_filter :load_company
  def load_company
    @company = Company.find(params[:company_id])
  end

  # GET /products
  # GET /products.xml
  def index
    begin
      @products = @company.products.find(:all)
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid products without company_id" )
      flash[:notice] = "只能查找某个公司的列表！"
      redirect_to :action => :index
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @products }
      end
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    begin
      @product = @company.products.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}" )
      flash[:notice] = "找不到id=#{params[:id]}的产品"
      redirect_to :action => :index
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product }
      end
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = @company.products.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = @company.products.find(params[:id])

  end

  # POST /products
  # POST /products.xml
  def create
    @product = @company.products.build(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to([@company,@product]) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }       
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = @company.products.find(params[:id])
    
    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to([@company,@product]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = @company.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(company_products_url(@company)) }
      format.xml  { head :ok }
    end
  end

end
