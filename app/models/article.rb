class Article < ActiveRecord::Base
  has_many :questions
  belongs_to :book
end
