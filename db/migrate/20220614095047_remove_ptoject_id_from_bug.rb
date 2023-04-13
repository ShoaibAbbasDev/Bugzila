# frozen_string_literal: true

class RemovePtojectIdFromBug < ActiveRecord::Migration[5.2]
  def change
    remove_column :bugs, :project_id
  end
end
