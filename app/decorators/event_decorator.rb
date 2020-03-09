class EventDecorator < ApplicationDecorator
  delegate_all

  def available_tickets
    object.total_tickets - object.sold_tickets
  end
end
