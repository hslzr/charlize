# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string
#  starts_at  :datetime
#  ends_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Event < ApplicationRecord
  # Relations
  has_many :activities, dependent: :destroy
  has_many :attendees

  # Attachments
  has_one_attached :cover_image

  # Validations
  validates :name, :starts_at, :ends_at, presence: true
  validates :total_tickets,
    presence: true,
    numericality: { greater_than: 0 }
  #validate :end_date_cannot_be_before_start_date

  # Callbacks
  before_create :generate_slug

  # Scopes
  scope :active_now, -> { where('starts_at <= NOW() AND ends_at >= NOW()') }

  def active?
    starts_at < DateTime.now && ends_at > DateTime.now
  end

  def to_param
    slug
  end

  private

  def end_date_cannot_be_before_start_date
    return if ends_at > starts_at

    errors.add(:ends_at, 'can\'t be before start date')
  end

  def generate_slug
    self.slug = SecureRandom.hex(2) + '-' + name.parameterize
  end
end
