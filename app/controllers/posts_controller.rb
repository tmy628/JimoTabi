class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path(@post)
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    # 新しい投稿が上にくるように設定
  end

  def show
    @post = Post.find(params[:id])
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
