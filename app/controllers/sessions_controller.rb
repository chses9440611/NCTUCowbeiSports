class SessionsController < ApplicationController
	layout "application"

	def index
	end

	def new
	end

	def create
		#user = User.find_by(student_id: params[:"/sessions"=> :student_id])
		stu_id, pass = params_permit[:student_id], params_permit[:password]
		user = User.find_by student_id: stu_id#student_id: params[:"/sessions"=> :student_id])

		if user && user.authenticate(pass)
			session[:user_id] = user.id
			redirect_to "/", notice: "登入成功"
		else
			flash[:alert] = "學號或密碼錯誤" # because session is not ActiveRecord
			render :new
		end

	end

	def destroy
		if log_out
		redirect_to home_path, notice: "登出成功"
		else
			redirect_to home_path, alert: "登出失敗"
		end
	end

	private 
		def params_permit
			params.require(:"/sessions").permit(:student_id, :password)
		end

end
