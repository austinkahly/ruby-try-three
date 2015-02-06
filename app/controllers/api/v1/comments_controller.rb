class Api::V1::CommentsController < Api::V1::BaseController
  
  before_filter :set_user_id, only: :create
  load_and_authorize_resource
  
  private
  def set_user_id
    params[:comment][:user_id] = current_user.id
  end

  def comment_params
    params.require(:comment).permit(:user_id, :body, :article_id)
  end

end
