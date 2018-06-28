class UsersController < ApplicationController
	layout "application"

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

    if verify_recaptcha(model: @user) and @user.save
			log_in(@user)
			redirect_to root_path, notice: "註冊成功"
		else
			render :new
		end
	end

	def search
		user = User.find_by student_id: params[:student_id]
		if user
      render json: {name: user.name, id: user.id}
		else
			render json: {name: "查無此人！", id: nil}
		end
	end

	private 
	
	def user_params
		params.require(:user).permit(:student_id, :email, :password, :password_confirmation, :name)
	end
	

end
