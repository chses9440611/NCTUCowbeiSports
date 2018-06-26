class Event < ApplicationRecord
	has_many :teams, dependent: :destroy
	accepts_nested_attributes_for :teams, :allow_destroy => true

	#validation
	validates :name, :event_date, :max_num_team, :min_num_team, :max_num_people, :min_num_people, presence: true
end
