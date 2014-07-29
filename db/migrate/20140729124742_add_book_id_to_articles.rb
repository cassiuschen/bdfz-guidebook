class AddBookIdToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :book_id, :integer
  end
end
