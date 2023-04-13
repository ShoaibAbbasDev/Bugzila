# frozen_string_literal: true

class AddProjectIdToBug < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :project, index: true, foreign_key: true
  end
end
