class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @theme = Theme.find(params[:theme_id])
    @posts = Post.where(theme_id: params[:theme_id])
  end

  def new
    @theme = Theme.find(params[:theme_id])
    @post = Post.new
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @post = Post.new(post_params.merge(theme_id: params[:theme_id], user_id: current_user.id))

    if @post.save
      redirect_to theme_posts_url, notice:"登録が完了しました。"
    else
      render :new
    end
  end

  def edit
    @theme = Theme.find(params[:theme_id])
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to theme_post_url, notice: "編集を完了しました。"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to theme_posts_url, notice: "削除を完了しました。"
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :theme_id, :contributer, :post_text)
  end
end