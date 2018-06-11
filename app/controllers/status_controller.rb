class StatusController < ApplicationController

	def index
		@events = Event.all
		@teams = Team.all
	end
end
