class Book < ActiveRecord::Base
  has_many :articles

  def last_updated_at
  	articles.all.map {|a| a.updated_at}.max
  end
end
