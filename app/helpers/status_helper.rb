module StatusHelper

	def find_member(team_id)
		user_ids = TeamList.select("user_id").where("team_id": team_id)
		User.where({id: user_ids})
	end


	def get_teams(event_id)
		return Team.where("event_id": event_id)
	end
end
