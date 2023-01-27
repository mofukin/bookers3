class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @post_books = @user.books.page(params[:page])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to "/users/#{current_user.id}"
    else
      render :edit
    end

  end

  def users
    @user = User.find(current_user.id)
    @post_books = @user.books.page(params[:page])
    @book = Book.new
    @users = User.page(params[:page])
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "successfully"
      redirect_to "/books"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to "/users/#{current_user.id}"
    end
  end
  # def create
  #   @book = Book.new
  #   book = Book.new(book_params)
  #   book.user_id = current_user.id
  #   book.save
  #   redirect_to '/homes/top'
  # end

  # private
  # def book_params
  #   params.require(:book).permit(:title, :body, :user_id)
  # end
end
