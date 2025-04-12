module ValificationUser
  def ensure_correct_user_for_book(book)
    unless book.user == current_user
      render json: {error: "You are not authorized to perform this action."}, status: :forbidden
    end
  end

end
