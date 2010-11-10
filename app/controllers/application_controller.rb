class ApplicationController < ActionController::Base
  #protect_from_forgery
  #before_filter :authenticate_user!, :except => [:show, :index]
  #load_and_authorize_resource
    
  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = "Access denied!"  
    redirect_to root_url  
  end    
  
  #rescue_from ActiveRecord::RecordNotFound, :with => :no_encontrado #400   
  #rescue_from ActiveResource::ResourceNotFound, :with => :no_encontrado #404
  #rescue_from ActionView::TemplateError, :with => :no_encontrado #500
  #rescue_from ActionController::UnknownController, :with => :no_encontrado #404 
  #rescue_from ActionController::MethodNotAllowed, :with => :no_encontrado #405   
  #rescue_from ActionController::InvalidAuthenticityToken, :with => :no_encontrado #405
  #rescue_from ActionController::UnknownAction, :with => :no_encontrado #501
  #rescue_from ActionController::RoutingError, :with => :no_encontrado
   
  #def error
  #end
  #protected
  #def no_encontrado
   # render :controller => 'application', :action=>"error"
    #render :text => "Error 404", :status => 404
  #end
    
end
