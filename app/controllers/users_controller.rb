class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]
  def index
    @users = User.all
  end

  def show
    @user_info = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    is_matching_login_user
    @user = current_user
  end

  def update
    is_matching_login_user
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile,:profile_image,:introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
