class Article < ActiveRecord::Base
	belongs_to :user
 	validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
	validates :body, presence: true, length: { minimum: 20 }, uniqueness: true

	before_save :set_visits_count

	def update_visits_count
		self.save if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1)
	end

	protected

	def set_visits_count
		self.visits_count ||= 0
	end
end
