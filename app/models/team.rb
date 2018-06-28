class Team < ApplicationRecord
	belongs_to :event
	has_many :team_lists, dependent: :destroy
	has_many :users, through: :team_lists, :validate => false
	accepts_nested_attributes_for :users, :allow_destroy => true
	attr_accessor :student_id
	#:max_members, :min_members

	#validates
	validates :name, :users, presence: true
	validates :name, length: {maximum: 15, too_long: "最多15字"}
	#validates :users, length

end
