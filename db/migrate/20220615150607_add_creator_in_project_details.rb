# frozen_string_literal: true

class AddCreatorInProjectDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :project_details, :project_creator, :integer, index: true, null: false
  end
end
