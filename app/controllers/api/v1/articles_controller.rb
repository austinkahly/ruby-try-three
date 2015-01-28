class Api::V1::ArticlesController < Api::V1::BaseController

  before_filter :set_user_id, only: :create
  
  private
  def set_user_id
    params[:article][:user_id] = current_user.id
  end
  
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

end
