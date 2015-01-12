require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = build(:article, title: nil)
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article without body" do
    article = build(:article, text: nil)
    assert_not article.save, "Saved the article without a body."
  end

  test "create a valid article" do
    article = build(:article);
    assert article.save
  end

end