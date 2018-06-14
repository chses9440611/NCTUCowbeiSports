class Event < ApplicationRecord
	has_many :teams, dependent: :destroy
	accepts_nested_attributes_for :teams, :allow_destroy => true
end
