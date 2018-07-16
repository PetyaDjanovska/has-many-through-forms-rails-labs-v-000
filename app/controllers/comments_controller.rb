class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end


  def user_attributes=(user_attributes)
    self.user = User.where(:id => user_attributes[:user_id]).first_or_create do |u|
      u.username = user_attributes[:username]
      u.email = user_attributes[:email]
    end
  end
end
