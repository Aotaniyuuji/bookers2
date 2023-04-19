class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
end
