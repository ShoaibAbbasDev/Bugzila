# frozen_string_literal: true

class BugPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    return true if @user.QA?
  end

  def update?
    return true if @user.Developer?
  end
end
