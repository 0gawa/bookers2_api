require 'rails_helper'

RSpec.describe "BookCommentモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    let(:user) { create(:user) }
    let(:book) { create(:book)}

    context "bodyカラム" do
      it "空欄でないこと" do
        book_comment = BookComment.new(body: "", user_id: user.id, book_id: book.id)
        expect(book_comment.valid?).to eq false
      end

      it "300文字以下であること: 300文字は〇" do
        book_comment = BookComment.new(body: Faker::Lorem.characters(number: 300), user_id: user.id, book_id: book.id)
        expect(book_comment.valid?).to eq true
      end

      it "300文字以下であること: 301文字は×" do
        book_comment = BookComment.new(body: Faker::Lorem.characters(number: 301), user_id: user.id, book_id: book.id)
        expect(book_comment.valid?).to eq false
      end
    end

  end
end
