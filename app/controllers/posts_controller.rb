class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
    # 1ページ分の決められた数のデータだけを、新しい順に取得するように変更
  end

  def show
    @post = Post.find(params[:id])
    @likes_count = Like.where(post_id: @post.id).count
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    # 定義した@latと@lngの変数をJavaScriptでも扱えるように、それぞれgon.latとgon.lngに代入
    gon.lat = @lat
    gon.lng = @lng
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
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
