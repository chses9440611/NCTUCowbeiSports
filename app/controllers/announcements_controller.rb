class AnnouncementsController < ActionController::Base
	layout "application"
	before_action :find_annc, only: [:show]
	def new
		@announcement = Announcement.new
	end
	
	def create
		@announcement = Announcement.new(params_permit)
		if @announcement.save
			redirect_to "/", notice: "發佈成功"
		else
			render :new
		end
	end

	def show
		
	end



	private

	def params_permit
		params.require(:announcement).permit(:title, :content)
	end	
	
	def find_annc
		@annc = Announcement.find(params[:id])
	end

end
