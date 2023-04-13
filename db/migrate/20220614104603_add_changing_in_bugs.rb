# frozen_string_literal: true

class AddChangingInBugs < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :title, :string, limit: 30, default: '', unique: true
    change_column :bugs, :description, :string, default: ''
    change_column :bugs, :status, :string, limit: 20, default: ''
    change_column :bugs, :bug_type, :string, limit: 20, default: ''
    change_column :bugs, :deadline, :date
  end
end
