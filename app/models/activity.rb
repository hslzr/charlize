class Activity < ApplicationRecord
  belongs_to :event

  has_rich_text :description
end
