class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :location
      t.float :cost
      t.string :title
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
