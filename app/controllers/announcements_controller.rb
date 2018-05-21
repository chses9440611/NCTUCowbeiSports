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

	def destroy
		@an = Announcement.find(params[:id])
		@an.destroy if @an
		redirect_to home_path, notice: "公告已刪除"
	end



	private

	def params_permit
		params.require(:announcement).permit(:title, :content)
	end	
	
	def find_annc
		@annc = Announcement.find(params[:id])
	end

end
