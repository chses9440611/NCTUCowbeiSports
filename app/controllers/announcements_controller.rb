class AnnouncementsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:destroy]
	before_action :find_annc, only: [:show, :destroy]
	def new
		@announcement = Announcement.new
	end

  def index
    #@is_admin = true
    @anncs = Announcement.order(id: :desc)
		if !is_admin
			render 'index'
		else
			render 'index_logged'
		end
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
