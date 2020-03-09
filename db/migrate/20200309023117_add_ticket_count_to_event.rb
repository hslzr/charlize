class AddTicketCountToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :total_tickets, :integer, default: 1
    add_column :events, :sold_tickets, :integer, default: 0
  end
end
