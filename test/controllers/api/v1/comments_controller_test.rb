require 'test_helper'

class Api::V1::CommentsControllerTest < ActionController::TestCase
  
  test "should get index"  do
    create(:comment)
    create(:comment)
    create(:comment)

    get :index
    assert_response :success

    comments = JSON.parse(response.body)

    assert comments.count >= 3
  end

  test "should create comment" do
    comment_attr = attributes_for(:comment)
    assert_difference('Comment.count') do
      post :create, comment: comment_attr
    end
    assert_response(200)
    comment = JSON.parse(response.body)

    assert_not_nil comment["id"]
    assert_equal comment_attr[:article_id], comment["article_id"]
    assert_equal comment_attr[:text], comment["text"]
    assert_equal comment_attr[:commenter], comment["commenter"]
  end

  test "should destroy comment" do
    comment = create(:comment)

    assert_difference('Comment.count', -1) do
      delete :destroy, id: comment.id
    end
    assert_response(200)
  end

  test "should fetch comment" do
    comment = create(:comment)
    get :show, id: comment.id 
    assert_response(200)
    comment2 = JSON.parse(response.body)
    assert_equal comment.user_id, comment2["user_id"]
  end
end
