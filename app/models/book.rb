class Book < ActiveRecord::Base
  has_many :articles
end
