class HomeController < ApplicationController
	layout "application"
	def index
		@is_login = true
    @is_admin = true
    @anncs = Announcement.all
	end

end
