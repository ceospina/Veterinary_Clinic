class DoctorsController < ApplicationController
    def index
    @doctors = Doctor.find(:all)
  end
  def new
    @doctor = Doctor.new
  end
  
  def create
    @doctor = Doctor.new(params[:doctor])
    if @doctor.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to doctors_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @doctor = Doctor.find(params[:id])
  end
  
  def update 
    if @doctor = Doctor.find(params[:id])
      @doctor.update_attributes(params[:doctor])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to doctors_path
    else
      render :action => "edit"
    end
  end
  def destroy
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy
      flash[:notice] = "El elemento ha sido eliminado exitosamente"
    else
      flash[:error] = "Problemas en la eliminacion"
    end
    redirect_to doctors_path
  end
  
  def show
    @doctor = Doctor.find(params[:id])
  end
end
