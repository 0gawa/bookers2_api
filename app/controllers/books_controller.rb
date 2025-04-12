class BooksController < ApplicationController
  include ValificationUser
  
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_book, only: %i[ show update destroy ]

  def index
    @books = Book.all

    render json: @books
  end

  def show
    # count up view count
    @book.view_count+=1
    @book.save

    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :body, :user_id, :view_count ])
    end

end
