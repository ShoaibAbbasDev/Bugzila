# frozen_string_literal: true

class ChangeAttibutesInBug < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :bug_assign, :integer, default: 0
  end
end
