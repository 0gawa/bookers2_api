class FavoritesController < ApplicationController
  before_action :set_book, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.new(book_id: @book.id)
    
    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    render json: {message: "Favorite removed successfully"}, status: :ok
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
