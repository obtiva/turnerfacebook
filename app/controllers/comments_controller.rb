class CommentsController < ApplicationController
  def create
    comment_receiver = User.find(params[:comment_receiver])
    current_user.comment_on(comment_receiver,params[:body])
    redirect_to battles_path(:user_id=>comment_receiver.id)
  end
end
