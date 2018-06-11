class EventsController < ApplicationController
	layout "application"

	before_action :find_event, :except => [:index, :new, :create]

	def index
		@events = Event.all
	end



	def create
		@event = Event.new(params_permit)
		if @event.save
			redirect_to events_path, notice: "新增成功"
		else
			render :new
		end

	end

	def new
		@event = Event.new
	end

	def show
	end

	def edit
	end

	def update
		if @event.update(params_permit)
			redirect_to events_path, notice: "更新成功"
		else 
			render :edit, notice: "更新失敗"
		end
	end

	def destroy
		if @event
			if @event.destroy
				redirect_to events_path, notice: "活動已刪除"
			else
				redirect_to events_path, notice: "活動刪除失敗"
			end
		end

	end


	private
	
		def params_permit
			params.require(:event).permit(:name, :event_date, :max_num_team, :min_num_team, :max_num_people, :min_num_people, :description)
		end


		def find_event
			@event = Event.find(params[:id])
		end

end
