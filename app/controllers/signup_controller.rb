class SignupController < ApplicationController
	layout 'application'
	before_action :find_event

	def index
	end


	def new
		@team = @event.teams.build
	end

	def create
		@team = @event.teams.build(params_permit)
		@team.users = add_member(params_permit[:users_attributes].values)
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
			params.require(:team).permit(:name, :event_id, users_attributes: [:id, :student_id])
		end
	
		def add_member(attribute)
			user_list = []
			for student in attribute 
				user_list.push(User.find_by :student_id => student[:student_id])
				
			end
			return user_list
		end

end

