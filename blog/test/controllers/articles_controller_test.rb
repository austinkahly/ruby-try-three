require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index"  do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: {title: 'This is an updated title?', text: 'Some text'}
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "new should render correct layout" do
    get :new
    assert_template layout: "layouts/application", partial: "_form"
  end

  test "should create article 2" do
    assert_difference('Article.count') do
      post :create, article: {title: 'Hello there', text: 'This is my first article.'}
    end
    assert_redirected_to article_path(assigns(:article))
  end
end
