class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title,                           null: false
      t.text :content
      t.text :official_answer
      t.datetime :create_at
      t.boolean :if_finished,                    default: false
      t.integer :author_id
      t.references :article, index: true

      t.timestamps
    end
  end
end
