class SignupController < ApplicationController
	layout 'application'
	before_action :find_event
	def new
		@team = @event.teams.build
	end

	def create
		@team = @event.teams.build(params_permit)
		@team.event_id = @event.id
		if @team.save
			redirect_to events_path, notice: "報名成功"
		else
			render :new
		end
	end

	private 
		
		def find_event
			@event = Event.find(params[:event_id])
		end

		def params_permit
			params.require(:team).permit(:name)
		end

end

