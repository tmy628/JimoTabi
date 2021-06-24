class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    # 親モデル(User)に属する子モデル(Like)のインスタンスを新たに生成するのでbuildを使う
    @post = @like.post
    @like.save
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    @like.destroy
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
