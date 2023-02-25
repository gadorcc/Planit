class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.integer :planner_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :location
      t.float :cost
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
