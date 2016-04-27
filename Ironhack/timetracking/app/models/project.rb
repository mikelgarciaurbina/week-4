class Project < ActiveRecord::Base
	def self.fetch_projects(number)
		order(created_at: :desc).limit(number)
	end
end
