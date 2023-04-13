# frozen_string_literal: true

class BugsController < ApplicationController
  before_action :set_project, only: %i[new create index show destory]
  before_action :set_bug, only: %i[edit update show destory bug_assignment mark_complete]

  def index
    @bugs = @project.bugs
  end

  def new
    @bugs = @project.bugs.build
  end

  def create
    @bugs = @project.bugs.build(bug_params)
    authorize @bugs
    if @bugs.save

      redirect_to project_bugs_path(@bugs.project_id), info: 'Bug Created Sucessfuly'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bug
  end

  def update
    @bug.bug_assign = current_user.name
    authorize @bugs

    if @bug.save
      redirect_to project_bugs_path(@bug.project_id), info: 'Assign bug Sucessfuly'
    else
      redirect_to project_bugs_path(@bug.project_id), danger: 'Unabled to assign bug'
    end
  end

  def bug_assignment
    @bug.bug_assign = current_user.name
    if @bug.save
      redirect_to project_bugs_path(@bug.project_id), info: 'Assign bug tour self Sucessfuly'
    else
      redirect_to project_bugs_path(@bug.project_id), danger: 'Not assign bug'
    end
  end

  def mark_complete
    @bug.completion_status = true if @bug.bug_assign == current_user.name
    if @bug.save
      redirect_to project_bugs_path(@bug.project_id), info: 'Bug marks as completed Sucessfuly'
    else
      redirect_to project_bugs_path(@bug.project_id), danger: 'Not Completed'
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :bug_image, :bug_type, :status, :deadline, :user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_bug
    @bug = params[:id].nil? ? Bug.find(params[:bug_id]) : Bug.find(params[:id])
  end
end
