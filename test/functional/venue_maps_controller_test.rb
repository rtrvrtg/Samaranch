require 'test_helper'

class VenueMapsControllerTest < ActionController::TestCase
  setup do
    @venue_map = venue_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venue_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue_map" do
    assert_difference('VenueMap.count') do
      post :create, :venue_map => @venue_map.attributes
    end

    assert_redirected_to venue_map_path(assigns(:venue_map))
  end

  test "should show venue_map" do
    get :show, :id => @venue_map.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @venue_map.to_param
    assert_response :success
  end

  test "should update venue_map" do
    put :update, :id => @venue_map.to_param, :venue_map => @venue_map.attributes
    assert_redirected_to venue_map_path(assigns(:venue_map))
  end

  test "should destroy venue_map" do
    assert_difference('VenueMap.count', -1) do
      delete :destroy, :id => @venue_map.to_param
    end

    assert_redirected_to venue_maps_path
  end
end
