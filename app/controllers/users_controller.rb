class UsersController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @post_books = @user.book
  end

  def edit
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to '/homes/top'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
