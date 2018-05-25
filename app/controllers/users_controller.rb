class UsersController < ApplicationController
	layout "application"

	def new
		@user = User.new
	end


	def create
		@user = User.new(params_permit)

		if @user.save
			log_in(@user)
			redirect_to "/", notice: "註冊成功"
		else
			render :new
		end
	end
	

	private 
	
	def params_permit
		params.require(:user).permit(:student_id, :email, :password, :password_confirmation)
	end
	

end
