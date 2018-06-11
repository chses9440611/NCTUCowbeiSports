class User < ApplicationRecord

	has_secure_password
	has_many :team_lists
	has_many :teams, through: :team_lists
	#@has_many :teams
	accepts_nested_attributes_for :teams

end
