class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_format_of :phone, :with => /\A\d{3}\d{3}\d{3}\z/
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
