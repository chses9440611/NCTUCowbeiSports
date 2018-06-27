class SignupController < ApplicationController
	layout 'application'
	before_action :find_event, except: [:destroy]

	def index
	end


	def new
		if check_teams_num < @event.max_num_team
			@team = @event.teams.build
		else
			redirect_to events_status_path, notice: "報名已滿"
		end
	end

	def create
		@team = @event.teams.build(params_permit)
		
		if params_permit.key?("users_attributes")
			@team.users = add_member(params_permit[:users_attributes].values)
		else
			@team.users = []
		end
		
		if @team.save
			redirect_to events_path, notice: "報名成功"
		else
			render :new
		end
	end


	def destroy
		@team = Team.find(params[:id])
		if @team
			if @team.destroy
				redirect_to events_status_path, notice: "已取消隊伍"
			else
				redirect_to events_status_path, notice: "取消失敗"
			end
		else
			redirect_to events_status_path, notice: "無此隊伍"
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
				if student[:student_id] != ""
					user_list.push(User.find_by :student_id => student[:student_id])
				end
				
			end
			return user_list
		end

		def check_teams_num
			@event.teams.size
		end

end

