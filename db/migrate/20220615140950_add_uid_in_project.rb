# frozen_string_literal: true

class AddUidInProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :user, index: true, foreign_key: true
    remove_column :project_details, :project_creator
  end
end
