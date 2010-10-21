class BreedsController < ApplicationController
 def index
    @breeds= Breed.find(:all)
  end
  def new
    @breed = Breed.new
  end
  
  def create
    @breed = Breed.new(params[:breed])
    if @breed.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to breeds_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @breed = Breed.find(params[:id])
  end
  
  def update 
    if @breed = Breed.find(params[:id])
      @breed.update_attributes(params[:breed])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to breeds_path
    else
      render :action => "edit"
    end
  end
  def destroy
    @breed = Breed.find(params[:id])
    if @breed.destroy
		  flash[:notice] = "El elemento ha sido borrado exitosamente"
		else
		  flash[:error] = "Problemas en la eliminacion"
	  end
	  redirect_to breeds_path
  end
  
  def show
	@breed = Breed.find(params[:id])
  end
end
