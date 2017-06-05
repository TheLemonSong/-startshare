class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.string :details
      t.date :start_date
      t.date :end_date
      t.string :stage
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
