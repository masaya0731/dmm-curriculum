class AgainBooksController < ApplicationController

  def index
    @books = AgainBook.all
    @book = AgainBook.new
    @user = current_user
  end

  def create
    @user = current_user
    @book = AgainBook.new(again_book_params)
    @book.user_id = current_user.id
    redirect_to again_books_path(@book) if @book.save
  end

  def show
    @newbook = AgainBook.new
    @book = AgainBook.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = AgainBook.find(params[:id])
    # 投稿がログイン中のユーザーと紐づいていなければマイページに遷移させる
    redirect_to again_user_path(current_user) unless @book.user == current_user
  end

  def update
    @book = AgainBook.find(params[:id])
    if @book.update(again_book_params)
      redirect_to again_book_path(@book)
    end
  end

  def destroy
    @book = AgainBook.find(params[:id])
    @book.destroy
    redirect_to again_books_path
  end

  private

  def again_book_params
    params.require(:again_book).permit(:title, :body)
  end
end
