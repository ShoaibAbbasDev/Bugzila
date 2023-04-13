# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    user = current_user
    @projects = current_user.role == 'QA' ? Project.all : user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    authorize @project

    if @project.save
      ProjectDetail.create(user_id: current_user.id, project_id: @project.id, project_creator: current_user.id)
      redirect_to projects_path, info: 'Project Created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    authorize @project

    if @project.update(project_params)
      redirect_to projects_path, info: 'Project Updated Sucessfuly'
    else
      redirect_to projects_path, danger: 'Unabled to update project'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project

    if @project.destroy
      redirect_to projects_path, info: 'Project Dleted Sucessfuly'
    else
      redirect_to projects_path, danger: 'Unabled to delete project'
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status, :due_date)
  end
end
