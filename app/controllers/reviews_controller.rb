class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @book = Book.find(params[:book_id])
    @reviews = Review.where(book_id: params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params.merge(book_id: params[:book_id], user_id: current_user.id))

    if @review.save
      redirect_to book_reviews_url, notice:"登録が完了しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update!(review_params)
    redirect_to book_reviews_url, notice: "編集を完了しました。"
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to book_reviews_url, notice: "削除完了しました。"
  end

  private

  def review_params
    params.require(:review).permit(:review_text, :book_id, :user_id, :when_read, :how_feel)
  end
end