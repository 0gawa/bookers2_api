class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # user_idとbook_idの組み合わせが一意であることの確認
  validates :user_id, uniqueness: { scope: :book_id }
  validates :user_id, presence: true
  validates :book_id, presence: true
end
