class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.timestamp :starts_at
      t.timestamp :ends_at

      t.timestamps
    end
  end
end
