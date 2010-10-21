class HorariesController < ApplicationController
  def index
    @horaries = Horary.find(:all)
  end
  def new
    @horary = Horary.new
  end
  
  def create
    @horary = Horary.new(params[:horary])
    if @horary.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to horaries_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @horary = Horary.find(params[:id])
  end
  
  def update 
    if @horary = Horary.find(params[:id])
      @horary.update_attributes(params[:horary])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to horaries_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @horary = Horary.find(params[:id])
    if @horary.destroy
		  flash[:notice] = "El elemento ha sido eliminado exitosamente"
		else
		  flash[:error] = "Problemas en la eliminacion"
	  end
	  redirect_to horaries_path
  end
  
  def show
	@horary = Horary.find(params[:id])
  end
end
