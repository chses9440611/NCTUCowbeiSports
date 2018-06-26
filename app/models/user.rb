class User < ApplicationRecord

	has_secure_password
	has_many :team_lists
	has_many :teams, through: :team_lists
	#@has_many :teams
	accepts_nested_attributes_for :teams, :allow_destroy => true

	#validates
	validates :name, :student_id, :email, :password, :password_confirmation, presence: true
	validates :student_id, :email, uniqueness: true
	validates :password, length: {minimum: 6, too_short: "至少輸入6位英數字"} 

end
