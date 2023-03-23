class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update, :destroy]


  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    if @post.user_id = current_user.id
      if @post.save
        redirect_to user_path(current_user.id), notice: ((@post.post_status == "published") ? "投稿を公開にしました。": "投稿を非公開しました。")
      else
        redirect_to new_post_path(@post), alert: "入力内容をご確認ください。"
      end
    end
  end

  def index
  end


  def edit
  end

  def update
  end

  def destroy
  end



  private

  def post_params
    params.require(:post).permit(:user_id, :post_status, :sentence, :image)
  end
    #emojilistいったん抜かしてみる

  def ensure_current_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to user_path(current_user.id)
    end
  end

end


