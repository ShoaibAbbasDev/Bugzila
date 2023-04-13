# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :status
      t.date :start_date
      t.date :due_date
      t.timestamps
    end
  end
end
