class Question < ActiveRecord::Base
  belongs_to :article
  has_many :comments
end
