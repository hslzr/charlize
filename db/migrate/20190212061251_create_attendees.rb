class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :last_name
      t.string :sur_name
      t.string :phone
      t.string :email
      t.boolean :subscribe_email
      t.boolean :subscribe_phone
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
