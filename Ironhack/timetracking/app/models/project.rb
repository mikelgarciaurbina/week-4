class Project < ActiveRecord::Base
  has_many :time_entries

  def self.fetch_projects(number)
    order(created_at: :desc).limit(number)
  end
end
