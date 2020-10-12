class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    # @reviews = Review.where(book_id: @book.id).limit(3)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to books_path, notice:"「#{@book.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to books_url, notice: "「#{book.title}」を編集しました。"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url, notice: "「#{book.title}」を削除しました。"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :who_recommend, :image, :user_id)
  end
end
