class Event < ApplicationRecord
  # Relations
  has_many :activities, dependent: :destroy

  # Attachments
  has_one_attached :cover_image
end
