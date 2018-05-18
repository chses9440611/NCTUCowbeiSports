class HomeController < ApplicationController
	layout "application"
	@is_login=false
	def index
		@is_login=true
		render locals: {
			anncs: Announcement.select("title, content, created_at")
		}
	end

end
