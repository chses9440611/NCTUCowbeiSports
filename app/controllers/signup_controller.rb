class SignupController < ApplicationController
  layout 'application'
  before_action :find_event, except: [:destroy]

  def index
  end

  def new
    @team = @event.teams.build
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
    user_params = params.require(:team).permit(users_attributes: [:student_id])
    user_params[:users_attributes].values.map { |param| param[:student_id] }
  end

  def users
    User.find_by(student_id: user_ids)
  end
end

