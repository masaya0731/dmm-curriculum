class ReviewsController < ApplicationController
  def index
    @post = ReviewPost.new
    @posts = ReviewPost.all
  end

  def create
    @post = ReviewPost.new(review_post_params)
    if @post.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to review_path(@post)
    else
      @posts = ReviewPost.all
      render :index
    end
  end

  def show
    @post = ReviewPost.find(params[:id])
  end

  def edit
    @post = ReviewPost.find(params[:id])
  end

  def update
    @post = ReviewPost.find(params[:id])
    if @post.update(review_post_params)
      flash[:notice] = 'Book was successfully update.'
      redirect_to review_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = ReviewPost.find(params[:id])
    post.destroy
    flash[:danger] = 'Book was successfully destroyed.'
    redirect_to reviews_path
  end

  private

  def review_post_params
    params.require(:review_post).permit(:title, :body)
  end
end
