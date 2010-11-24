class AnimalsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
	def index
		@animals = Animal.find(:all)
		respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @animals }
    end
  end
  
  def new
    @animal =Animal.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @animal }
    end
  end

  def show
    @animal = Animal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @animal }
    end
  end
  
  def create
    @animal = Animal.new(params[:animal])  
     respond_to do |format|
      if @animal.save
        format.html { redirect_to(@animal, :notice => 'Animal was successfully created.') }
        format.xml  { render :xml => @animal, :status => :created, :location => @animal}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @animal.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def edit 
    @animal = Animal.find(params[:id])
  end
  
  def update 
    @animal = Animal.find(params[:id])
    respond_to do |format|
      if @animal.update_attributes(params[:animal])
        format.html { redirect_to(@animal, :notice => 'Animal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @animal.errors, :status => :unprocessable_entity }
      end
    end
    
  end
    
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
      respond_to do |format|
        format.html { redirect_to(animals_url, :notice =>  "Animal Deleted")}
        format.xml  { head :ok }
      end   
  end
    
  def search
     params[:name]||=[]
     params[:document]||=[]
     #@animals=Animal.search_name_and_client(params[:name],params[:document]).paginate(:per_page=>1, :page=>params[:page]) unless (params[:document].empty? or params[:name].empty?) 
     #@animals=Animal.search_client(params[:document]).paginate(:per_page=>1, :page=>params[:page]) unless params[:document].empty? or params[:name].present?
      #solo por nombre
    # @animals=Animal.search_name(params[:name]).paginate(:per_page=>1, :page=>params[:page]) unless params[:name].empty? or params[:document].present?
     @animals = Animal.search(params[:name],params[:document]).paginate(:per_page=>1, :page=>params[:page])
     @animals||=[]
     respond_to do |format|
        format.html # search.html.erb
        format.xml  { render :xml => @animals }
        format.js {render 'search.js.erb'}
      end
    end
    
    
end
