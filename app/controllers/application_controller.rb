class ApplicationController < ActionController::Base
  protect_from_forgery  
  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = "Access denied!"  
    redirect_to root_url  
  end      
  rescue_from ActiveRecord::RecordNotFound, :with => :no_encontrado #400   
 #rescue_from ActiveResource::ResourceNotFound, :with => :no_encontrado #404
  rescue_from ActionView::TemplateError, :with => :no_encontrado #500
  rescue_from ActionController::UnknownController, :with => :no_encontrado #404 
  rescue_from ActionController::MethodNotAllowed, :with => :no_encontrado #405   
  rescue_from ActionController::InvalidAuthenticityToken, :with => :no_encontrado #405
  rescue_from ActionController::UnknownAction, :with => :no_encontrado #501
  rescue_from ActionController::RoutingError, :with => :no_encontrado
  rescue_from ActiveRecord::RecordInvalid, :with => :no_encontrado
 
  protected
  def no_encontrado
     flash[:error] = "Ups something happened, we are working to resolve!"  
     redirect_to root_url  
  end
  
  
    
end
