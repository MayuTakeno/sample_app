class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    byebug
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body )
  end
end
