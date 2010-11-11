require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get servicios" do
    get :servicios
    assert_response :success
  end

  test "should get citas" do
    get :citas
    assert_response :success
  end

  test "should get noticias" do
    get :noticias
    assert_response :success
  end

  test "should get clasificados" do
    get :clasificados
    assert_response :success
  end

end
