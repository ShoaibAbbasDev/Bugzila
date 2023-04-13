# frozen_string_literal: true

class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :type
      t.date :deadline
      t.references :project

      t.timestamps
    end
  end
end
