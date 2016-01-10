require 'test_helper'

class MeasureNamesControllerTest < ActionController::TestCase
  setup do
    @measure_name = measure_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measure_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measure_name" do
    assert_difference('MeasureName.count') do
      post :create, measure_name: { name: @measure_name.name }
    end

    assert_redirected_to measure_name_path(assigns(:measure_name))
  end

  test "should show measure_name" do
    get :show, id: @measure_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measure_name
    assert_response :success
  end

  test "should update measure_name" do
    patch :update, id: @measure_name, measure_name: { name: @measure_name.name }
    assert_redirected_to measure_name_path(assigns(:measure_name))
  end

  test "should destroy measure_name" do
    assert_difference('MeasureName.count', -1) do
      delete :destroy, id: @measure_name
    end

    assert_redirected_to measure_names_path
  end
end
