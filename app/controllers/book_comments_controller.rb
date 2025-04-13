class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    
    if @book_comment.save
      render json: @book_comment, status: :created
    else
      render json: {message: "Comment was not saved"}, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    if @comment
      @comment.destroy
      render json: {message: "Comment was deleted"}, status: :ok
    else
      render json: {message: "Comment was not deleted"}, status: :unprocessable_entity
    end
  end

  private
  
  def book_comment_params
    params.require(:book_comment).permit(:body, :title)
  end
end
