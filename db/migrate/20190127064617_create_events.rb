class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.timestamp :starts_at
      t.timestamp :ends_at

      t.timestamps
    end
  end
end
