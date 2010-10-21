class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.find(:all)
  end
  def new
    @meeting = Meeting.new
  end
  
  def create
    @meeting = Meeting.new(params[:meeting])
    if @meeting.save
      flash[:notice] = "El elemento ha sido Salvado exitosamente"
      redirect_to meetings_path
    else
      flash[:error] = "El elemento no ha sido Salvado"
      render :action => "new"
    end
    
  end
  
  def edit 
    @meeting = Meeting.find(params[:id])
  end
  
  def update 
    if @meeting = Meeting.find(params[:id])
      @meeting.update_attributes(params[:meeting])
      flash[:notice] = "El elemento ha sido actualizado exitosamente"
      redirect_to meetings_path
    else
      render :action => "edit"
    end
  end
  def destroy
    @meeting = Meeting.find(params[:id])
    if @meeting.destroy
      flash[:notice] = "El elemento ha sido borrado exitosamente"
    else
      flash[:error] = "Problemas en la eliminacion"
    end
    redirect_to meetings_path
  end
  
  def show
  @meeting = Meeting.find(params[:id])
  end
end
