class AgainBooksController < ApplicationController
  # Bookers2のコントローラー
  def index
    @books = AgainBook.all
    @book = AgainBook.new
    @user = current_user
  end

  def create
    @user = current_user
    @book = AgainBook.new(again_book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to again_book_path(@book)
    else
      @books = AgainBook.all
      render :index
    end
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
      flash[:success] = 'You have updated book successfully.'
      redirect_to again_book_path(@book)
    else
      render :edit
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
