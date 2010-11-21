class UsersController < ApplicationController
 # before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :get_user, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]

  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.accessible_by(current_ability, :index).limit(20)
  # @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found( :xml, :html)
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    #@user = User.new
      
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
   #    @user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
    rescue ActiveRecord::RecordNotFound
     respond_to_not_found(:json, :xml, :html)
  end

  # POST /users
  # POST /users.xml
  def create
    params[:user][:role_ids] ||= []  
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save and @user.role_ids=params[:user][:role_ids]
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
 def update
   params[:user][:role_ids] ||= []  
    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
    else
      @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
    end    
 
    respond_to do |format|
      if @user.errors[:base].empty? and @user.update_attributes(params[:user]) and @user.role_ids=params[:user][:role_ids]
        
        flash[:notice] = "Your account has been updated"
        format.xml  { head :ok }
        format.html { render :action => :edit }
      else
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
 
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found( :xml, :html)
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    #@user = User.find(params[:id])
    #@user.destroy
    @user.destroy
    respond_to do |format|
      format.html  { redirect_to(users_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found( :xml, :html)
   end
   
   def correo
    # @users=User.all
     @user=User.new
     c= (params[:first_name])
        if c #||='gracias por utilizar la clinica'   
          
          UserMailer.promocion(params[:first_name]).deliver 
          # @users.each { |user| UserMailer.promocion(user,params[:first_name] ).deliver}
        end
   end
end
