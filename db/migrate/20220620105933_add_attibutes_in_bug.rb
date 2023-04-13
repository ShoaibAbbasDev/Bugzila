# frozen_string_literal: true

class AddAttibutesInBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :bug_assign, :integer
    add_column :bugs, :completion_status, :boolean, default: 0
  end
end
