class Article < ActiveRecord::Base
 	validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
	validates :body, presence: true, length: { minimum: 20 }, uniqueness: true
end
