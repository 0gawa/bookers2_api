require 'rails_helper'

RSpec.describe "Favoriteモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    subject { favorite.valid? }

    let(:user) { create(:user) }
    let(:book) { create(:book) }
    let(:favorite) { build(:favorite, user_id: user.id, book_id: book.id) }

    it "user_idが空欄でないこと" do
      favorite.user_id = ""
      is_expected.to eq false
    end

    it "book_idが空欄でないこと" do
      favorite.book_id = ""
      is_expected.to eq false
    end

    it "user_idとbook_idの組み合わせが一意であること" do
      favorite.save
      another_favorite = build(:favorite, user_id: user.id, book_id: book.id)
      expect(another_favorite).not_to be_valid
    end
  end

  describe "アソシエーションのテスト" do
    it "UserモデルとN:1の関係になっている" do
      expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "BookモデルとN:1の関係になっている" do
      expect(Favorite.reflect_on_association(:book).macro).to eq :belongs_to
    end
  end
end
