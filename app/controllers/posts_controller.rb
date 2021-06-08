class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :caption)
  end
end
