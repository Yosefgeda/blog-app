class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @like = post.likes.new(author: current_user)
    if @like.save
      redirect_to user_post_likes_path(user_id: current_user.id, post_id: post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
