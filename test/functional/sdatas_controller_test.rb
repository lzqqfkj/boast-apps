require 'test_helper'

class SdatasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sdatas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sdata" do
    assert_difference('Sdata.count') do
      post :create, :sdata => { }
    end

    assert_redirected_to sdata_path(assigns(:sdata))
  end

  test "should show sdata" do
    get :show, :id => sdatas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sdatas(:one).id
    assert_response :success
  end

  test "should update sdata" do
    put :update, :id => sdatas(:one).id, :sdata => { }
    assert_redirected_to sdata_path(assigns(:sdata))
  end

  test "should destroy sdata" do
    assert_difference('Sdata.count', -1) do
      delete :destroy, :id => sdatas(:one).id
    end

    assert_redirected_to sdatas_path
  end
end
