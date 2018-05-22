class AnnouncementsController < ActionController::Base
	layout "application"
	skip_before_action :verify_authenticity_token, only: [:destroy]
	before_action :find_annc, only: [:show, :destroy]
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
		#@announcement = Announcement.find(params[:id])
		if @annc
			if @annc.destroy
				redirect_to home_path, notice: "公告已刪除"
			else
				redirect_to home_path, notice: "公告未刪除"
			end
		end
	end



	private

	def params_permit
		params.require(:announcement).permit(:title, :content)
	end	
	
	def find_annc
		@annc = Announcement.find(params[:id])
	end

end
