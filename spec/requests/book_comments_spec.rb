require 'rails_helper'

RSpec.describe "BookCommentsコントローラーのテスト", type: :request do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:auth_token) { sign_in(user) }

  context "createアクション" do
    it "コメントの保存ができる" do
      post book_book_comments_path(book_id: book.id), params: { book_comment: { body: "テストコメント" } }, headers: auth_token
      expect(response.status).to eq 201
      expect(BookComment.last.body).to eq "テストコメント"
    end

    it "空欄のコメントは保存できない" do
      post book_book_comments_path(book_id: book.id), params: { book_comment: { body: "" } }, headers: auth_token
      expect(response.status).to eq 422
      expect(BookComment.last).to be_nil
    end
  end

  context "destroyアクション" do
    it "コメントの削除ができる" do
      book_comment = create(:book_comment, book: book, user: user)
      delete "/books/#{book.id}/book_comments/#{book_comment.id}", headers: auth_token
      expect(response.status).to eq 200
      expect(BookComment.exists?(book_comment.id)).to be false
    end

    it "存在しないコメントの削除はできない" do
      delete "/books/#{book.id}/book_comments/99999", headers: auth_token
      expect(response.status).to eq 422
    end
  end
end
