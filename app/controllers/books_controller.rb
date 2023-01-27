class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def index
    @user = User.find(params[:id])
    @post_books = @user.book.page(params[:page])
  end

  def books
    @user = User.find(current_user.id)
    @books = Book.page(params[:page])
    @book = Book.new
    @error = User.find(current_user.id)


  end

  def show
    @user = Book.find(params[:id])
    @post_books = @user.user
    @book = Book.new
    @books = Book.find(params[:id])
    @post_comment = Comment.new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    if @books.save
       flash[:notice] = "successfully"
       redirect_to "/books/#{@books.id}"
    else
      @error = @books
      @user = User.find(current_user.id)
      @books = Book.page(params[:page])
      @book = Book.new
      render :books
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to "/books/#{@book.id}"

    else

      render :edit
    end

  end

  def destroy

    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"

  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def is_matching_login_user
    bookers = Book.find(params[:id])
    users = bookers.user
    unless users.id == current_user.id
      redirect_to '/books'
    end
  end
end
