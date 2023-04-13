# frozen_string_literal: true

class ProjectDetailsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
  end

  def create
    @project_details = ProjectDetail.new(user_id: params[:user_id],
                                         project_id: params[:project_id], project_creator: current_user.id)
    authorize @project_details
    if @project_details.save
      redirect_to project_users_path(params[:project_id]), info: 'User Entered Sucessfuly'
    else
      redirect_to project_users_path(params[:project_id]), danger: 'User Alredy Exit'
    end
  end

  def destroy
    project_details = ProjectDetail.find(params[:id])

    if project_details.destroy
      redirect_to project_project_details_path(project_details.project_id), info: 'User Deleted Sucessfuly'
    else
      redirect_to project_project_details_path(project_details.project_id), danger: 'User not Deleted'
    end
  end
end
