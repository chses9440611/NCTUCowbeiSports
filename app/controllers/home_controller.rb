class HomeController < ApplicationController
	layout "application"
	def index
    @is_admin = true
    @anncs = Announcement.all.reverse
		if !is_logged
			render 'index'
		else
			render 'index_logged'
		end
	end

end
