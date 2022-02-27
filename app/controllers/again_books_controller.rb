class AgainBooksController < ApplicationController
  def index; end

  def create
    @user = current_user
    @book = AgainBook.new(again_book_params)
    @book.user_id = current_user.id
    redirect_to again_books_path(@book) if @book.save
  end

  def show
    @user = User.find(params[:id])
    @book = AgainBook.find(params[:id])
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def again_book_params
    params.require(:again_book).permit(:title, :body)
  end
end
