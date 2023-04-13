# frozen_string_literal: true

class AddChangingInProject < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :name, :string, limit: 55, default: '', unique: true, null: false
    change_column :projects, :description, :string, default: '', null: false
    change_column :projects, :status, :string, default: '', null: false, limit: 20
    change_column :projects, :due_date, :date, default: '', null: false
  end
end
