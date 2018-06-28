class Team < ApplicationRecord
	belongs_to :event
	has_many :team_lists, dependent: :destroy
	has_many :users, through: :team_lists, :validate => false
	#has_many :users
	accepts_nested_attributes_for :users, :allow_destroy => false
	attr_accessor :student_id
end
