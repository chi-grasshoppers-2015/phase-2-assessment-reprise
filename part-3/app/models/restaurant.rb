class Restaurant < ActiveRecord::Base
	has_many :reviews
	belongs_to :creator, class_name: "User"
	has_many :reviewers, through: :reviews

	validates :name, :cuisine, :city, presence: true
end
