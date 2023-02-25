class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :participant, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
