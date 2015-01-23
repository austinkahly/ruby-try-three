require 'test_helper'

class Api::V1::ArticlesControllerTest < ActionController::TestCase


  test "should get index"  do
    create(:article, user_id: @user.id)
    create(:article, user_id: @user.id)
    create(:article, user_id: @user.id)

    get :index
    assert_response :success

    articles = JSON.parse(response.body)

    assert articles.count >= 3
  end

  test "should create article" do
    article_attr = attributes_for(:article, user_id: @user.id)
    assert_difference('Article.count') do
      post :create, article: article_attr
    end
    assert_response(200)
    article = JSON.parse(response.body)
    assert_not_nil article["id"]
    assert_equal article_attr[:text], article["text"]
    assert_equal article_attr[:title], article["title"]
  end

  test "should destroy article" do
    article = create(:article, user_id: @user.id)

    assert_difference('Article.count', -1) do
      delete :destroy, id: article.id
    end
    assert_response(200)
  end

  test "should validate title" do
    article_attr = attributes_for(:article, title: 'sho', user_id: @user.id)
    post :create, article: article_attr
    assert_response(400)
    article = JSON.parse(response.body)
    
    assert_equal "is too short (minimum is 5 characters)", article["title"][0]
    assert_not article["id"]
  end

  test "should fetch article" do
    article = create(:article, user_id: @user.id)
    get :show, id: article.id 
    assert_response(200)
    article2 = JSON.parse(response.body)
    assert_equal article.title, article2["title"]
  end
end
