require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article without body" do
    article = Article.new
    article.title = "This is a title"
    assert_not article.save, "Saved the article without a body."
  end

  test "create a valid article" do
    article = Article.new
    article.title = "This is a title."
    article.text = "This is the body of an article."
    assert article.save
  end

end