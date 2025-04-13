class CreateBookComments < ActiveRecord::Migration[8.0]
  def change
    create_table :book_comments do |t|
      t.string :title
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
