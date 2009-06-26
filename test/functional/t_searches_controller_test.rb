require 'test_helper'

class TSearchesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:t_searches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create t_search" do
    assert_difference('TSearch.count') do
      post :create, :t_search => { }
    end

    assert_redirected_to t_search_path(assigns(:t_search))
  end

  test "should show t_search" do
    get :show, :id => t_searches(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => t_searches(:one).id
    assert_response :success
  end

  test "should update t_search" do
    put :update, :id => t_searches(:one).id, :t_search => { }
    assert_redirected_to t_search_path(assigns(:t_search))
  end

  test "should destroy t_search" do
    assert_difference('TSearch.count', -1) do
      delete :destroy, :id => t_searches(:one).id
    end

    assert_redirected_to t_searches_path
  end
end
