class ClientsController < ApplicationController
before_filter :authenticate_user!, :except => [:show, :index]
load_and_authorize_resource
  # GET /clients
  # GET /clients.xml
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to(@client, :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to(@client, :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
     params[:name]||=[]
     params[:document]||=[]
     
     #@consulta= Consulta.new(:date=>'') unless params[:consulta]
     #@consulta||=Consulta.new(params[:consulta])
     #@client=Client.new(params[:client])
     #por nombre y fecha
     #@clients=Client.for_name_and_cedula(params[:name],params[:document]).paginate(:per_page=>5, :page=>params[:page]) unless (params[:name].empty? or params[:document].empty?)
     #@clients||=[]
     #solo por nombre
     #@clients=Client.for_name(params[:name]).paginate(:per_page=>5, :page=>params[:page]) unless params[:name].empty? or params[:document].present?     
     #solo por cedula
     #@clients=Client.for_cedula(params[:document]).paginate(:per_page=>5, :page=>params[:page]) unless params[:document].empty? or params[:name].present?
     @clients=Client.search(params[:name],params[:document]).paginate(:per_page=>5, :page=>params[:page])
     @clients||=[]
     
    
        
      respond_to do |format|
        format.html # search.html.erb
        format.xml  { render :xml => @consultas }
        format.js {render 'search.js.erb'}
      end
    
  end
end
