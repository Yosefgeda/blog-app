class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:author_id])
    @post = @user.posts
    @comments = Comment.where(posts: @post)

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def new
    @user = User.find(params[:author_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(author: current_user, **comment_params)
    puts @comment
    puts comment_params
    puts @post
    if @comment.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Comment Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
