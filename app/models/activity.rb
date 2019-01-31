class Activity < ApplicationRecord
  # Relations
  belongs_to :event

  # Attachments
  has_rich_text :description

  # Validations
  validates :name, :starts_at, :ends_at, presence: true
  validate :end_date_cannot_be_before_start_date
  validate :start_hour_cannot_be_before_event
  validate :end_hour_cannot_be_after_event

  # Scopes
  scope :active_now, -> { where('starts_at <= NOW() AND ends_at >= NOW()') }

  private

  def end_date_cannot_be_before_start_date
    return if ends_at > starts_at

    errors.add(:ends_at, 'can\'t be before start date')
  end

  def start_hour_cannot_be_before_event
    return if starts_at >= event.starts_at

    errors.add(:starts_at, 'can\'t be before event\'s start date')
  end

  def end_hour_cannot_be_after_event
    return if ends_at <= event.ends_at

    errors.add(:ends_at, 'can\'t be after event\'s end date')
  end
end
