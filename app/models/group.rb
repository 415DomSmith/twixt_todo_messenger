class Group < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :associations, dependent: :destroy
	has_many :users, through: :associations
	has_many :lists, dependent: :destroy
end
