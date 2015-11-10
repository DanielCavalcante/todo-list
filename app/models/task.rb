class Task < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :title, :user
	
	scope :sort_by_pending, -> {
		order('completed_at nulls first, lower(title) asc')
	}

	def completed?
		completed_at?
	end

	def pending?
		!completed?
	end

	def status
		completed? ? 'completed' : 'pending'
	end
end
