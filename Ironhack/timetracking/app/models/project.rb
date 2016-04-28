class Project < ActiveRecord::Base
  has_many :time_entries, dependent: :destroy

  validates :name, presence: true
  validate :minimum_length

  def self.fetch_projects(number)
    order(created_at: :desc).limit(number)
  end

  def minimum_length
    if name.present? && name.size < 3
      errors[:name] << "Longitud invalida"
    end
  end

  def self.clean_old
    projects = where("created_at < ?", Date.today - 1.week)
    #projects = where.not(created_at: (Date.today - 1.week)..Date.today)
    projects.destroy_all
  end
end
