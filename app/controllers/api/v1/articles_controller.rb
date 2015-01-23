class Api::V1::ArticlesController < Api::V1::BaseController

  before_filter :set_user_id, only: :create
  load_and_authorize_resource
  
  def set_user_id
    params[:article][:user_id] = current_user.id
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

end
