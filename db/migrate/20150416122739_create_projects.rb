class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.date :beginDate
      t.date :endDate
      t.text :description

      t.timestamps null: false
    end
  end
end
