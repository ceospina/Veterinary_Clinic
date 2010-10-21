class TypeConsultsController < ApplicationController
   def index
    @type_consults= TypeConsult.find(:all)
  end
  def new
    @type_consult = TypeConsult.new
  end
  
  def create
    @type_consult = TypeConsult.new(params[:type_consult])
    if @type_consult.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to type_consults_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @type_consult = TypeConsult.find(params[:id])
  end
  
  def update 
    if @type_consult = TypeConsult.find(params[:id])
      @type_consult.update_attributes(params[:type_consult])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to type_consults_path
    else
      render :action => "edit"
      
    end
  end
  def destroy
    @type_consult = TypeConsult.find(params[:id])
    if @type_consult.destroy
      flash[:notice] = "El elemento ha sido borrado exitosamente"
    else
      flash[:error] = "Problemas en la eliminacion"
    end
    redirect_to type_consults_path
  end
  
  def show
  @type_consult = TypeConsult.find(params[:id])
  end
end
