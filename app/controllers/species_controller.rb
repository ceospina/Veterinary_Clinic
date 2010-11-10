class SpeciesController < ApplicationController
before_filter :authenticate_user!, :except => [:show, :index]
load_and_authorize_resource

  # GET /species
  # GET /species.xml
  def index
    @species = Species.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @species }
    end
  end

  # GET /species/1
  # GET /species/1.xml
  def show
    @specie = Species.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @specie}
    end
  end

  # GET /species/new
  # GET /species/new.xml
  def new
    @specie = Species.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specie }
    end
  end

  # GET /species/1/edit
  def edit
    @specie = Species.find(params[:id])
  end

  # POST /species
  # POST /species.xml
  def create
    @specie = Species.new(params[:specie])

    respond_to do |format|
      if @specie.save
        format.html { redirect_to(@specie, :notice => 'Specie was successfully created.') }
        format.xml  { render :xml => @specie, :status => :created, :location => @specie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /species/1
  # PUT /species/1.xml
  def update
    @specie = Species.find(params[:id])
    respond_to do |format|
      if @specie.update_attributes(params[:specie])
        format.html { redirect_to(@specie, :notice => 'Specie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /species/1
  # DELETE /species/1.xml
  def destroy
    @specie = Species.find(params[:id])
    @specie.destroy

    respond_to do |format|
      format.html { redirect_to(species_index_path) }
      format.xml  { head :ok }
    end
  end
end
