class UsersController < ApplicationController
	layout "application"

	def new
		@user = User.new
	end


	def create
		@user = User.new(params_permit)

		if @user.save and verify_recaptcha(model: @user)
			log_in(@user)
			redirect_to "/", notice: "註冊成功"
		else
			render :new
		end
	end

	def show
		@user = User.find_by student_id: params[:student_id]
		if @user
			render json: {"name": @user.name}
		else
			render json: {"name": "查無此人！"}
		end
	end

	

	private 
	
	def params_permit
		params.require(:user).permit(:student_id, :email, :password, :password_confirmation, :name)
	end
	

end
