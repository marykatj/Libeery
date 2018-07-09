class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true
      t.string :description
      t.string :situation

      t.timestamps
    end
  end
end
