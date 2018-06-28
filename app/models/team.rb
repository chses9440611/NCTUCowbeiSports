class Team < ApplicationRecord
	belongs_to :event
	has_many :team_lists, dependent: :destroy
	has_many :users, through: :team_lists, :validate => false
	accepts_nested_attributes_for :users, :allow_destroy => false
	attr_accessor :student_id
	attr_accessor :max_members
	attr_accessor :min_members
  	validate :validate_teams
  	validates :name, presence: true
	validates :name, length: {maximum: 15, too_long: "最多15字"}
	#validates :users, length: {in: @min_members .. @max_members }
	validate :validate_members_num
  	def validate_teams
  	  	if users.empty?
  	  	  errors.add(:users, "can't be empty")
  	 	end
  	end

	
	def validate_members_num
		@event = Event.find(event_id)
		if users.size > @event.max_num_people
			errors.add(:team, "每隊最多#{@event.max_num_people}人")
		elsif users.size < @event.min_num_people
			errors.add(:team, "每隊最少#{@event.min_num_people}人")
		end
	end

end
