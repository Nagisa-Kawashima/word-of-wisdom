class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :post_status, default: 0, null: false
      t.text :sentence, null: false
      t.string :emoji_list, null: false, default: '😀'
      t.timestamps
    end
  end
end
