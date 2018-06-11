class Team < ApplicationRecord
	belongs_to :event
	has_many :team_lists, dependent: :destroy
	has_many :users, through: :team_lists
	#has_many :users
	accepts_nested_attributes_for :users, :allow_destroy => true
	attr_accessor :student_id
	#def initialize(student_ids)
	#	@student_ids = []
	#end

end
