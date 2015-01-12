require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "should not save comment without author" do
    comment = build(:comment, commenter: nil)
    assert_not comment.save, "Saved the comment with no author"
  end

  test "should not save a comment without body" do
    comment = build(:comment, body: nil)
    assert_not comment.save, "Saved a comment without a body"
  end

  test "should not save a comment without an article" do
    comment = build(:comment, article: nil)
    assert_not comment.save, "Saved a comment without an article."
  end

  test "save a valid comment" do
    comment = build(:comment)
    assert comment.save
  end
end
