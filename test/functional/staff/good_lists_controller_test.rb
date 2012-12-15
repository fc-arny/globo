require 'test_helper'

class Staff::GoodListsControllerTest < ActionController::TestCase
  setup do
    @staff_good_list = staff_good_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staff_good_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staff_good_list" do
    assert_difference('Staff::GoodList.count') do
      post :create, staff_good_list: {  }
    end

    assert_redirected_to staff_good_list_path(assigns(:staff_good_list))
  end

  test "should show staff_good_list" do
    get :show, id: @staff_good_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @staff_good_list
    assert_response :success
  end

  test "should update staff_good_list" do
    put :update, id: @staff_good_list, staff_good_list: {  }
    assert_redirected_to staff_good_list_path(assigns(:staff_good_list))
  end

  test "should destroy staff_good_list" do
    assert_difference('Staff::GoodList.count', -1) do
      delete :destroy, id: @staff_good_list
    end

    assert_redirected_to staff_good_lists_path
  end
end
