class AnimalsController < ApplicationController
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
  #  if @animal.save
  #   flash[:notice] = "El elemento ha sido Salvado exitosamente"
  #   redirect_to animals_path
  #  else
  #    flash[:error] = "El elemento no ha sido Salvado"
  #  render :action => "new"
  #  end
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
   # if @animal = Animal.find(params[:id])
   #  @animal.update_attributes(params[:animal])
   #   flash[:notice] = "El elemento ha sido actualizado exitosamente"
   #   redirect_to animals_path
   # else
   #   render :action => "edit"
   # end
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
    #if @animal.destroy
    # flash[:notice] = "El elemento ha sido borrado exitosamente"
    #else
    #  flash[:error] = "problemas en la eliminacion"
    #end
		#redirect_to animals_path
    if @animal.destroy
      respond_to do |format|
        format.html { redirect_to(animals_url, :notice =>  "Animal Deleted")}
        format.xml  { head :ok }
      end
     else
       respond_to do |format|
        format.html { redirect_to(animals_url, :error =>  "Error Animal NO Deleted")}
       end
     end
    end
end
