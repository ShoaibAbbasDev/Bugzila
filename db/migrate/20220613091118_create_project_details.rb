# frozen_string_literal: true

class CreateProjectDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :project_details do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :project, foreign_key: true, index: true, null: false
      t.integer :project_creator, index: true

      t.timestamps
    end
  end
end
