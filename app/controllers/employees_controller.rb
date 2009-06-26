class EmployeesController < ApplicationController
  include AuthenticatedSystem
  
  before_filter :load_company
  def load_company
    @company = Company.find(params[:company_id])
  end
  # GET /employees
  # GET /employees.xml
  def index
    @employees = @company.employees.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.xml
  def show
    begin 
      @employee = @company.employees.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid employee #{params[:id]}" )
      flash[:notice] = "找不到id=#{params[:id]}的联系人"
      redirect_to :action => :index
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @employee }
      end
    end
  end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @employee = @company.employees.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = @company.employees.find(params[:id])
  end

  # POST /employees
  # POST /employees.xml
  def create
   
    @employee = @company.employees.build(params[:employee])

    respond_to do |format|
      if @employee.save
        flash[:notice] = 'Employee was successfully created.'
        format.html { redirect_to([@company,@employee]) }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    @employee = @company.employees.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        @employee.save
        flash[:notice] = 'Employee was successfully updated.'
        format.html { redirect_to([@company,@employee]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
  def destroy
    @employee = @company.employees.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(company_employees_url(@company)) }
      format.xml  { head :ok }
    end
  end
end
