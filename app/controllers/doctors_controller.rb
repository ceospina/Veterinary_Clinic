class DoctorsController < ApplicationController
before_filter :authenticate_user!, :except => [:show, :index]
load_and_authorize_resource
  # GET /doctors
  # GET /doctors.xml
  def index
    @doctors = Doctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.xml
  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.xml
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.xml
  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to(@doctor, :notice => 'Doctor was successfully created.') }
        format.xml  { render :xml => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.xml
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to(@doctor, :notice => 'Doctor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.xml
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to(doctors_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
     params[:name]||=[]
     params[:document]||=[]
     

     #por nombre y fecha
     #@doctors=Doctor.for_name_and_cedula(params[:name],params[:document]).paginate(:per_page=>5, :page=>params[:page]) unless (params[:name].empty? or params[:document].empty?)
     #@doctors||=[]
     #solo por nombre
     #@doctors=Doctor.for_name(params[:name]).paginate(:per_page=>5, :page=>params[:page]) unless params[:name].empty? or params[:document].present?
     #solo por cedula
     #@doctors=Doctor.for_cedula(params[:document]).paginate(:per_page=>5, :page=>params[:page]) unless params[:document].empty? or params[:name].present?
     @doctors=Doctor.search(params[:name],params[:document]).paginate(:per_page=>5, :page=>params[:page]) 
     @doctors||=[]
     
    
        
      respond_to do |format|
        format.html # search.html.erb
        format.xml  { render :xml => @consultas }
        format.js {render 'search.js.erb'}
      end
    
  end
end
