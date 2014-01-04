class Article < ActiveRecord::Base
	has_many :questions
end
