class CreateAuthor < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.string :bio
      t.integer :post_count

      t.timestamps
    end
  end
end
