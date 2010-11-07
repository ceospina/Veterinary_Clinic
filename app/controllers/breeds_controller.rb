class BreedsController < ApplicationController
before_filter :authenticate_user!, :except => [:show, :index]
load_and_authorize_resource
 def index
    @breeds= Breed.find(:all)
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @breeds }
    end
  end
  def new
    @breed = Breed.new
    respond_to do |format|
      format.html # new.rhtml
      format.xml  { render :xml => @breed }
    end
  end
  def show
  @breed = Breed.find(params[:id])
  respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @breed}
    end
  end
  def create
    @breed = Breed.new(params[:breed])
    respond_to do |format|
      if @breed.save 
        format.html{redirect_to(@breed, :notice => "Breed was successfully created") }
        format.xml{render :xml => @breed, :status => :created, :location =>@breed }
      else
        format.html{render :action => 'new'}
        format.xml{render :xml => @breed.errors, :status => :unprocessable_entity }        
      end
    end
    
  end
  
  def edit 
    @breed = Breed.find(params[:id])
  end
  
  def update 
    @breed = Breed.find(params[:id])
   respond_to do |format|
      if @breed.update_attributes(params[:breed])
        format.html { redirect_to(@breed, :notice => 'Breed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @breed.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @breed = Breed.find(params[:id])
    if @breed.destroy
		  respond_to do |format|
        format.html { redirect_to(breeds_url, :notice =>  "Breed Deleted")}
        format.xml  { head :ok }
      end
     else
       respond_to do |format|
        format.html { redirect_to(breeds_url, :error =>  "Error Breeds NO Deleted")}
       end
     end 
  end
end
