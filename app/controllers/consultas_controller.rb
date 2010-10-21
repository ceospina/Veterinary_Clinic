class ConsultasController < ApplicationController

	def index
		 @consultas = Consulta.all
	end
	
	def show
		@consulta= Consulta.find(params[:id])
	end
	
	def new
		@consulta= Consulta.new
	end
	
    def create
		@consulta = Consulta.new(params[:consulta])
		if @consulta.save
			flash[:notice]="Consulta Creada"
			redirect_to consultas_path 
		else
			flash[:error]="Problemas en la Creacion" 
			render :action => "new"	 
		end		
    end
	
    def edit 
		@consulta = Consulta.find(params[:id])
    end
	
	def update
		@consulta = Consulta.find(params[:id])		
			if @consulta.update_attributes(params[:animal])
				flash[:notice]="Consulta actualizado"
				redirect_to consultas_path 				
			else
				flash[:error]="Problemas en la actualizacion" 
				render :action => "edit"					
			end
	end 
	
	def destroy
		@consulta=Consulta.find(params[:id])
			if @consulta.destroy
				flash[:notice]="Consulta borrado"
			else
				flash[:error]="Problemas en el borrado" 		
			end
		redirect_to consultas_path 
	end
	
end
