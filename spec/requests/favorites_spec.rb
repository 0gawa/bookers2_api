require 'rails_helper'

RSpec.describe "Favoritesに関するルーティング", type: :routing do
  describe "createアクション" do
    let(:user) { create(:user) }
    let(:book) { create(:book) }
    let(:auth_token) { sign_in(user) }

    it "POST /books/:book_id/favorites" do
      expect(:post => "/books/#{book.id}/favorites").to route_to(
        controller: "favorites",
        action: "create",
        book_id: "1"
      )
    end
    it "Delete /books/:book_id/favorites" do
      expect(:delete => "/books/#{book.id}/favorites").to route_to(
        controller: "favorites",
        action: "destroy",
        book_id: "1"
      )
    end
  end
end
