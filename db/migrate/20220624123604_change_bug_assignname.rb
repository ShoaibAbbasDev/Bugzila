# frozen_string_literal: true

class ChangeBugAssignname < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :bug_assign, :string, default: ''
  end
end
