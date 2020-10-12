class ThemesController < ApplicationController
  before_action :authenticate_user!

  def index
    @themes = Theme.all
  end

  def show
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user_id = current_user.id
    
    if @theme.save
      redirect_to themes_url, notice:"「#{@theme.nickname}」さんのテーマを登録しました。"
    else
      render :new
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    theme = Theme.find(params[:id])
    theme.update!(theme_params)
    redirect_to themes_url, notice:"「#{@theme.nickname}」さんのテーマを更新しました。"
  end

  def destroy
    theme = Theme.find(params[:id])
    theme.destroy
    redirect_to themes_url, notice: "削除しました。"

  end

  private

  def theme_params
    params.require(:theme).permit(:user_id, :nickname, :theme_text)
  end
end
