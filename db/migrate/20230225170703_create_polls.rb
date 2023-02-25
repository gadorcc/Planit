class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.text :question
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
