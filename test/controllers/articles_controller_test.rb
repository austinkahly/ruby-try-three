require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index"  do
    create(:article)
    create(:article)
    create(:article)

    get :index
    assert_response :success
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

  test "should destroy article" do
    article = create(:article)

    assert_difference('Article.count', -1) do
      delete :destroy, id: article.id
    end
  end

  test "should validate title" do
    article_attr = attributes_for(:article, title: 'um')
    article = post :create, article: article_attr
    assert_not article["id"]
  end

  test "should update article" do
    article = create(:article)
    article.title = "This is a new article"
    # post :update, article: article
    # Why doesn't this post command work?
  end

  test "should fetch article" do
    article = create(:article)
    get :show, id: article.id
    assert_response(200)
  end

end
