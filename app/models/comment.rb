class Comment < ActiveRecord::Base
  belongs_to :questions
end
