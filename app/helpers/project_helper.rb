# frozen_string_literal: true

module ProjectHelper
  def find_project_manager(name)
    records = name.where(role: 'Manager')
  end

  def find_project_developer(name)
    records = name.where(role: 'Developer')
  end

  def find_project_qa(name)
    records = name.where(role: 'QA')
  end

  def find_project_bugs(name)
    name.bugs.count
  end
end
