class SpeciesController < ApplicationController
  def index
    @species= Specie.find(:all)
  end
  
  def new
    @specie = Specie.new
  end
  
  def create
    @specie = Specie.new(params[:specie])
    if @specie.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to species_index_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @specie = Specie.find(params[:id])
  end
  
  def update 
    if @specie = Specie.find(params[:id])
      @specie.update_attributes(params[:specie])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to species_index_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @specie = Specie.find(params[:id])
    if @specie.destroy
		  flash[:notice] = "El elemento ha sido borrado exitosamente"
		else
		  flash[:error] = "Problemas en la eliminacion"
	  end
	 redirect_to species_index_path
  end
  
  def show
	@specie = Specie.find(params[:id])
  end
end
