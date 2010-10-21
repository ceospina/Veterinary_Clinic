class AnimalsController < ApplicationController
	def index
		@animals = Animal.find(:all)
  end
  
  def new
    @animal =Animal.new
  end

  def show
    @animal = Animal.find(params[:id])
  end
  
  def create
    @animal = Animal.new(params[:animal])
    if @animal.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to animals_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @animal = Animal.find(params[:id])
  end
  
  def update 
    if @animal = Animal.find(params[:id])
      @animal.update_attributes(params[:animal])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to animals_path
    else
      render :action => "edit"
    end
  end
    
  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
     flash[:notice] = "El elemento ha sido borrado exitosamente"
    else
      flash[:error] = "problemas en la eliminacion"
    end
		redirect_to animals_path
	end
end
