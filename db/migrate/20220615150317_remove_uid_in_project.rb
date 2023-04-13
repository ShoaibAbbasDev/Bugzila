# frozen_string_literal: true

class RemoveUidInProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :user_id
  end
end
