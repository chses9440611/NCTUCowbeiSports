class TeamlistsController < ApplicationController
	before_action :find_team_member, only: [ :destroy ]
	
	def destroy
		if @team_member
			if @team_member.destroy
				redirect_to events_status_path, notice: "已取消此人"
			else
				redirect_to events_status_path, notice: "此人未取消"
			end
		end
	end


	private 
		
		def find_team_member
			@team_member = TeamList.where("team_id = ? and user_id = ?", params[:team_id], params[:user_id]).first
		end
		

		def params_permit
			params.permit(:team_id, :user_id)
		end

end
