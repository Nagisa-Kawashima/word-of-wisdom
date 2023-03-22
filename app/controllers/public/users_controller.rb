class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit, :show]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path,
      notice: "ユーザー情報を編集しました。"
    else
      redirect_to edit_user_path(@user),
      alert: "編集内容をご確認ください。"
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    # セッション情報を全て削除する
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
  end


  private


  def user_params
    params.require(:user).permit(:name, :email, :password, :is_deleted, :profile_image, :country_code)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
