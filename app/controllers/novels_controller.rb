class NovelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_novel, only: [:show, :edit, :update, :destroy]

  def index
    @novels = Novel.where("expires_at > ?", Time.current).order(created_at: :desc)
  end

  def show
    @novel = Novel.find(params[:id])
    redirect_to root_path, alert: 'この小説は表示できません。' if @novel.expires_at <= Time.current
  end

  def new
    @novel = current_user.novels.build
  end

  def create
    @novel = current_user.novels.build(novel_params)
    @novel.expires_at ||= 24.hours.from_now

    if @novel.save
      redirect_to @novel, notice: '小説を投稿しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    if @novel.user != current_user
      redirect_to root_path, alert: "権限がありません"
    elsif @novel.update(novel_params)
      redirect_to @novel, notice: "小説を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @novel.user != current_user
      redirect_to root_path, alert: "権限がありません"
    else
      @novel.destroy
      redirect_to root_path, notice: "小説を削除しました"
    end
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :content, :expires_at)
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end
end
