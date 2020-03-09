# == Schema Information
#
# Table name: attendees
#
#  id              :bigint           not null, primary key
#  name            :string
#  last_name       :string
#  sur_name        :string
#  phone           :string
#  email           :string
#  subscribe_email :boolean
#  subscribe_phone :boolean
#  event_id        :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Attendee < ApplicationRecord
  belongs_to :event
end
