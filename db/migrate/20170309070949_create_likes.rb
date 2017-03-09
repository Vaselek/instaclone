class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :status, default: :false
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :photo_id], unique: true
  end
end
