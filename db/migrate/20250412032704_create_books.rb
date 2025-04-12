class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
