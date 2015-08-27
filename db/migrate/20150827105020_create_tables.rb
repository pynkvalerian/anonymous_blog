class CreateTables < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.timestamps null: false
    end

    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :posts_tags do |t|
      t.integer :post_id, null: false
      t.integer :tag_id, null: false
      t.timestamps null: false
    end
  end
end
