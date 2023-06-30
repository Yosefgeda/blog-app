class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_posts_path, notice: 'Post Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post Deleted Successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
