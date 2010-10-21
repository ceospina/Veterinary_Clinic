class ClientsController < ApplicationController
  def index
    @clients = Client.find(:all)
  end
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to clients_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @client = Client.find(params[:id])
  end
  
  def update 
    if @client = Client.find(params[:id])
      @client.update_attributes(params[:client])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to clients_path
    else
      render :action => "edit"
    end
  end
  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      flash[:notice] = "El elemento ha sido borrado exitosamente"
    else
      flash[:error] = "Problemas en la eliminacion"		
	  end
	  redirect_to clients_path
  end
  
  def show
	@client = Client.find(params[:id])
  end
end
