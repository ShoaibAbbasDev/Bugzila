# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    @user.Manager?
  end

  def edit?
    @user.Manager?
  end

  def update?
    @user.Manager?
  end

  def destroy?
    @user.Manager?
  end

  def assign_user?
    @user.Manager?
  end

  def destroy_user?
    @user.Manager?
  end
end
