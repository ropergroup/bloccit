class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    create_table :sponsoredposts do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps null: false
    end
  end
end
