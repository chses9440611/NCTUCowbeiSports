class Team < ApplicationRecord
	belongs_to :event
	has_many :team_lists, dependent: :destroy
	has_many :users, through: :team_lists, :validate => false
	accepts_nested_attributes_for :users, :allow_destroy => false
	attr_accessor :student_id
  	validate :validate_teams
  	validates :name, presence: true
	validates :name, length: {maximum: 15, too_long: "最多15字"}
	
	validate :validate_members_num
	validate :validate_members_uniq
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

	def validate_members_uniq
		@teams = Team.where(event_id: event_id).pluck(:id)
		users.each do |user|
		betrayer = TeamList.where("user_id=? AND team_id IN(?)", user.id, @teams).pluck(:team_id)
			if betrayer.size >= 1
				errors.add(:users, " #{user.student_id } has been member of anotther team!")
			end
		end
	end
end
