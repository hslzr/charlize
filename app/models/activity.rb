class Activity < ApplicationRecord
  belongs_to :event

  has_rich_text :description

  # Validations
  validates :name, :starts_at, :ends_at, presence: true
  validate :end_date_cannot_be_before_start_date

  private

  def end_date_cannot_be_before_start_date
    return if ends_at > starts_at

    errors.add(:ends_at, 'can\'t be before start date')
  end
end
