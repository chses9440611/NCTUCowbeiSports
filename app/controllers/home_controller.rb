class HomeController < ApplicationController
	layout "application"
	def index
		@is_login = false
    @is_admin = true
    @anncs = Announcement.all.reverse
	end

end
