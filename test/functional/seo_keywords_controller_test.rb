require 'test_helper'

class SeoKeywordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seo_keywords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seo_keyword" do
    assert_difference('SeoKeyword.count') do
      post :create, :seo_keyword => { }
    end

    assert_redirected_to seo_keyword_path(assigns(:seo_keyword))
  end

  test "should show seo_keyword" do
    get :show, :id => seo_keywords(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => seo_keywords(:one).id
    assert_response :success
  end

  test "should update seo_keyword" do
    put :update, :id => seo_keywords(:one).id, :seo_keyword => { }
    assert_redirected_to seo_keyword_path(assigns(:seo_keyword))
  end

  test "should destroy seo_keyword" do
    assert_difference('SeoKeyword.count', -1) do
      delete :destroy, :id => seo_keywords(:one).id
    end

    assert_redirected_to seo_keywords_path
  end
end
