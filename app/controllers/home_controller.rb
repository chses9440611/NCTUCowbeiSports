class HomeController < ApplicationController
	layout "application"
	def index
		@is_login=true
		is_admin = true
		render locals: {
			anncs: Announcement.select("title, content, created_at"), is_admin: is_admin
		}
	end

end
