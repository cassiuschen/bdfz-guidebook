class AddShortnameToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :shortname, :string
  end
end
