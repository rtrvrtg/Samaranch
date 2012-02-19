require 'test_helper'

class SessionTypesControllerTest < ActionController::TestCase
  setup do
    @session_type = session_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_type" do
    assert_difference('SessionType.count') do
      post :create, :session_type => @session_type.attributes
    end

    assert_redirected_to session_type_path(assigns(:session_type))
  end

  test "should show session_type" do
    get :show, :id => @session_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @session_type.to_param
    assert_response :success
  end

  test "should update session_type" do
    put :update, :id => @session_type.to_param, :session_type => @session_type.attributes
    assert_redirected_to session_type_path(assigns(:session_type))
  end

  test "should destroy session_type" do
    assert_difference('SessionType.count', -1) do
      delete :destroy, :id => @session_type.to_param
    end

    assert_redirected_to session_types_path
  end
end
