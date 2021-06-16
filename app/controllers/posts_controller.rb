class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @post.build_spot
    # .buildメソッドではhas_oneの関係にあたるので@post.build_spotとする
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil)
    # formから@postオブジェクトを参照してタグの名前も一緒に送信するのでこの形で取得する .split(nil)で送信されてきた値を、スペースで区切って配列化
    if @post.save
      @post.save_tag(tag_list)
      # 取得したタグの配列をデータベースに保存する処理
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
    # 1ページ分の決められた数のデータだけを、新しい順に取得するように変更
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @likes_count = Like.where(post_id: @post.id).count
    # 投稿内容のスポットの値がnilでなければ、投稿詳細画面に地図を表示する
    if @post.spot != nil
      @lat = @post.spot.latitude
      @lng = @post.spot.longitude
      # 定義した@latと@lngの変数をJavaScriptでも扱えるように、それぞれgon.latとgon.lngに代入
      gon.lat = @lat
      gon.lng = @lng
    end
    # 投稿内容のタグの値がnilでなければ、投稿詳細画面にタグを表示する
    if @post.tags != nil
      @post_tags = @post.tags
    end
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
    params.require(:post).permit(:title, :image, :caption, spot_attributes: [:address])
  end

  # ログインユーザーでなければ投稿の編集・削除ができないように権限を設定する
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
