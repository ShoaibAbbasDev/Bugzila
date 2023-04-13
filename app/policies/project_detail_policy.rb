# frozen_string_literal: true

class ProjectDetailPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def new?
    return true if @user.Manager?
  end

  def create?
    return true if @user.Manager?
  end

  def destroy?
    return true if @user.Manager?
  end
end
