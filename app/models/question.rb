class Question < ActiveRecord::Base
  belongs_to :articles
  has_many :comments
end
