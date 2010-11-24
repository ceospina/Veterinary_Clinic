class ConsultasController < ApplicationController
before_filter :authenticate_user!, :except => [:show, :index]
load_and_authorize_resource
	def index
		 @consultas = Consulta.all
		 respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultas }
    end
	end
	
	def show
		@consulta= Consulta.find(params[:id])
		 respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consulta }
    end
	end
	
	def new
		@consulta= Consulta.new
	  respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consulta }
    end
	end
	
  def create    
		@consulta = Consulta.new(params[:consulta])

		respond_to do |format|
      if @consulta.save
        format.html { redirect_to(@consulta, :notice => 'Consulta was successfully created.') }
        format.xml  { render :xml => @consulta, :status => :created, :location => @consulta}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consulta.errors, :status => :unprocessable_entity }
      end
    end
  end
	
  def edit 
		@consulta = Consulta.find(params[:id])
  end
	
	def update
		@consulta = Consulta.find(params[:id])	

		respond_to do |format|
      if @consulta.update_attributes(params[:consulta])
        format.html { redirect_to(@consulta, :notice => 'Consulta was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consulta.errors, :status => :unprocessable_entity }
      end
    end
	end 
	
	def destroy
		@consulta = Consulta.find(params[:id])
    
    
     if @consulta.destroy
      respond_to do |format|
        format.html { redirect_to(consultas_url, :notice =>  "Consulta Deleted")}
        format.xml  { head :ok }
      end
     else
       respond_to do |format|
        format.html { redirect_to(consultas_url, :error =>  "Error Consulta NO Deleted")}
       end
     end
  end
  
  def search
     params[:nameAnimal]||=[]
     params[:date]||=[]
     
     #@consultas=Consulta.search_animal_and_date(params[:nameAnimal], params[:date]).paginate(:per_page=>1, :page=>params[:page]) unless (params[:nameAnimal].empty? or params[:date].empty?)
     #@consultas=Consulta.search_animal(params[:nameAnimal]).paginate(:per_page=>1, :page=>params[:page]) unless params[:nameAnimal].empty? or params[:date].present?   
     #solo por fecha
     #@consultas=Consulta.search_date(params[:date]).paginate(:per_page=>1, :page=>params[:page]) unless params[:date].empty? or params[:nameAnimal].present?
     @consultas=Consulta.search(params[:nameAnimal], params[:date]).paginate(:per_page=>1, :page=>params[:page])
     @consultas||=[]
    
        
      respond_to do |format|
        format.html # search.html.erb
        format.xml  { render :xml => @consultas }
        format.js {render 'search.js.erb'}
      end
    
  end
  
	
end
