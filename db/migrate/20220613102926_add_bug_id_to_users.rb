class AddBugIdToUsers < ActiveRecord::Migration[5.2]
  def change
  add_reference :users, :bug, foreign_key: true
  end
end
