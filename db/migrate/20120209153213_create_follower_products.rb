class CreateFollowerProducts < ActiveRecord::Migration
  def self.up
    create_table :follower_products do |t|
      t.integer :coefficient
      t.integer :follower_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :follower_products
  end
end
