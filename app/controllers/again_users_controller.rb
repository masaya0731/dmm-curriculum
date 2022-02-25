class AgainUsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @books = @user.again_books
    @book = AgainBook.new
  end

  def edit; end

  def update; end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email, :password)
  end
end
