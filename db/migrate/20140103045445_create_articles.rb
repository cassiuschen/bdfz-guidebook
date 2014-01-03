class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :order,               null: false
      t.string :title,                null: false
      t.text :content
      t.datetime :public_at
      t.datetime :last_edit_at
      t.integer :new_edit,            default: 0

      t.timestamps
    end
  end
end
