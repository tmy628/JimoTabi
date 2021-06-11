class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_currect_user, only: [:edit, :update, :destroy]

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
    @posts = Post.page(params[:page]).reverse_order
    # 1ページ分の決められた数のデータだけを、新しい順に取得するように変更
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :caption)
  end

  # ログインユーザーでなければ投稿の編集・削除ができないように権限を設定する
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
