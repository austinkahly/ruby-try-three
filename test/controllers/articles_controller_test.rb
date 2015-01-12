require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index"  do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should create article" do
    article_attr = attributes_for(:article)
    assert_difference('Article.count') do
      post :create, article: article_attr
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "new should render correct layout" do
    get :new
    assert_template layout: "layouts/application", partial: "_form"
  end

  test "should create article 2" do
    article_attr = attributes_for(:article)
    assert_difference('Article.count') do
      post :create, article: article_attr
    end
    assert_redirected_to article_path(assigns(:article))
  end
end
