# frozen_string_literal: true

class RenameTypeInBug < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :type, :bug_type
  end
end
