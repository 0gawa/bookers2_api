class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.integer :view_count

      t.timestamps
    end
  end
end
