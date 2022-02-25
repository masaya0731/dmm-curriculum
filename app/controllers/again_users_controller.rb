class AgainUsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.again_books
    @book = AgainBook.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to again_user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email, :password)
  end

end
