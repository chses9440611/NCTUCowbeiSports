class AnnouncementsController < ApplicationController
	before_action :annc_set, only: [:modal]
	layout "application"
	def new
		@is_login=true
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(annc_params)
		if @announcement.save
			redirect_to "/", notice: "發佈成功！"
		else
			render :new
		end
	end

	def modal
		render layout: false
	end

	private
	def annc_params
		params.require(:announcement).permit(:title, :content)
	end

	def annc_set
		@annc=Announcement.find(params[:id])
	end
end
