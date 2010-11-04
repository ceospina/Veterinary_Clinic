class HorariesController < ApplicationController
  # GET /horaries
  # GET /horaries.xml
  def index
    @horaries = Horary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @horaries }
    end
  end

  # GET /horaries/1
  # GET /horaries/1.xml
  def show
    @horary = Horary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @horary }
    end
  end

  # GET /horaries/new
  # GET /horaries/new.xml
  def new
    @horary = Horary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @horary }
    end
  end

  # GET /horaries/1/edit
  def edit
    @horary = Horary.find(params[:id])
  end

  # POST /horaries
  # POST /horaries.xml
  def create
    @horary = Horary.new(params[:horary])

    respond_to do |format|
      if @horary.save
        format.html { redirect_to(@horary, :notice => 'Horary was successfully created.') }
        format.xml  { render :xml => @horary, :status => :created, :location => @horary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @horary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /horaries/1
  # PUT /horaries/1.xml
  def update
    @horary = Horary.find(params[:id])

    respond_to do |format|
      if @horary.update_attributes(params[:horary])
        format.html { redirect_to(@horary, :notice => 'Horary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @horary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /horaries/1
  # DELETE /horaries/1.xml
  def destroy
    @horary = Horary.find(params[:id])
    @horary.destroy

    respond_to do |format|
      format.html { redirect_to(horaries_url) }
      format.xml  { head :ok }
    end
  end
end
