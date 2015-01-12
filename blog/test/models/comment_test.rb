require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @article = Article.new
    @article.title = "this is a title."
    @article.text = "This is the body of the article."
  end

  def teardown
    @article = nil
  end

  test "should not save comment without author" do
    comment = Comment.new
    comment.article = @article
    assert_not comment.save, "Saved the comment with no author"
  end

  test "should not save a comment without body" do
    comment = Comment.new
    comment.article = @article
    comment.commenter = "Austin"
    assert_not comment.save, "Saved a comment without a body"
  end

  test "should not save a comment without an article" do
    comment = Comment.new
    comment.commenter = "Austin"
    comment.body = "This is the body of the comment."
    assert_not comment.save, "Saved a comment without an article."
  end

  test "save a valid comment" do
    comment = Comment.new
    comment.article = @article
    comment.commenter = "Austin"
    comment.body = "This is the body of my comment"
    assert comment.save
  end
end
