class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @index = Book.all
  end

  def show
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
