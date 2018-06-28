class SignupController < ApplicationController
  layout 'application'
  before_action :find_event, except: [:destroy]

  def index
  end

  def new
		if @event.teams.size < @event.max_num_team
			@team = @event.teams.build
			@team.max_members = @event.max_num_people
			@team.min_members = @event.min_num_people
		else
			redirect_to events_status_path, notice: "報名已滿"
		end
  end

  def create
    @team = @event.teams.build(team_params)
    @team.users = users

    if @team.save
      redirect_to events_path, notice: "報名成功"
    else
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team
      if @team.destroy
        redirect_to events_status_path, notice: "已取消隊伍"
      else
        redirect_to events_status_path, notice: "取消失敗"
      end
    else
      redirect_to events_status_path, notice: "無此隊伍"
    end

  end


  private 

  def find_event
    @event = Event.find(params[:event_id])
  end

  def team_params
    params.require(:team).permit(:name, :event_id)
  end

  def user_ids
    permitted_params = params.require(:team).permit(users_attributes: [:student_id])
    user_params = permitted_params[:users_attributes]
    if user_params
      user_params.values.map { |param| param[:student_id] }
    else
      []
    end
  end

  def users
    User.where(student_id: user_ids)
  end

end

