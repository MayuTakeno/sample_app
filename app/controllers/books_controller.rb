class BooksController < ApplicationController

  def index
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
