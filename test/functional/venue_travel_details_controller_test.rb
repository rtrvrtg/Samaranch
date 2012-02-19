require 'test_helper'

class VenueTravelDetailsControllerTest < ActionController::TestCase
  setup do
    @venue_travel_detail = venue_travel_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venue_travel_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue_travel_detail" do
    assert_difference('VenueTravelDetail.count') do
      post :create, :venue_travel_detail => @venue_travel_detail.attributes
    end

    assert_redirected_to venue_travel_detail_path(assigns(:venue_travel_detail))
  end

  test "should show venue_travel_detail" do
    get :show, :id => @venue_travel_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @venue_travel_detail.to_param
    assert_response :success
  end

  test "should update venue_travel_detail" do
    put :update, :id => @venue_travel_detail.to_param, :venue_travel_detail => @venue_travel_detail.attributes
    assert_redirected_to venue_travel_detail_path(assigns(:venue_travel_detail))
  end

  test "should destroy venue_travel_detail" do
    assert_difference('VenueTravelDetail.count', -1) do
      delete :destroy, :id => @venue_travel_detail.to_param
    end

    assert_redirected_to venue_travel_details_path
  end
end
