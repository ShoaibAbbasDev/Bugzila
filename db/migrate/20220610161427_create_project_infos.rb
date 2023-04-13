class CreateProjectInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :project_infos do |t|
      t.references :user, foreign_key: true
      t.references :project

      t.timestamps
    end
  end
end
