class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.text :content
      t.datetime :create_at
      t.references :question, index: true

      t.timestamps
    end
  end
end
