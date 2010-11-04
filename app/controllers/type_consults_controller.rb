class TypeConsultsController < ApplicationController
  # GET /type_consults
  # GET /type_consults.xml
  def index
    @type_consults = TypeConsult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @type_consults }
    end
  end

  # GET /type_consults/1
  # GET /type_consults/1.xml
  def show
    @type_consult = TypeConsult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @type_consult }
    end
  end

  # GET /type_consults/new
  # GET /type_consults/new.xml
  def new
    @type_consult = TypeConsult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @type_consult }
    end
  end

  # GET /type_consults/1/edit
  def edit
    @type_consult = TypeConsult.find(params[:id])
  end

  # POST /type_consults
  # POST /type_consults.xml
  def create
    @type_consult = TypeConsult.new(params[:type_consult])

    respond_to do |format|
      if @type_consult.save
        format.html { redirect_to(@type_consult, :notice => 'Type consult was successfully created.') }
        format.xml  { render :xml => @type_consult, :status => :created, :location => @type_consult }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @type_consult.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /type_consults/1
  # PUT /type_consults/1.xml
  def update
    @type_consult = TypeConsult.find(params[:id])

    respond_to do |format|
      if @type_consult.update_attributes(params[:type_consult])
        format.html { redirect_to(@type_consult, :notice => 'Type consult was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @type_consult.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /type_consults/1
  # DELETE /type_consults/1.xml
  def destroy
    @type_consult = TypeConsult.find(params[:id])
    @type_consult.destroy

    respond_to do |format|
      format.html { redirect_to(type_consults_url) }
      format.xml  { head :ok }
    end
  end
end
