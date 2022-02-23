class ReviewsController < ApplicationController
  def index
    @post = ReviewPost.new
    @posts = ReviewPost.all
  end

  def create
    post = ReviewPost.new(review_post_params)
    post.save
    redirect_to review_path(post.id)
  end

  def show
    @post = ReviewPost.find(params[:id])
  end

  def edit
    @post = ReviewPost.find(params[:id])
  end

  def update
    post = ReviewPost.find(params[:id])
    post.update(review_post_params)
    redirect_to review_path(post.id)
  end

  def destroy
    post = ReviewPost.find(params[:id])
    post.destroy
    redirect_to reviews_path
  end

  private

  def review_post_params
    params.require(:review_post).permit(:title, :body)
  end
end
