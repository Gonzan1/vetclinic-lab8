class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_many :treatments

  # Enum (Reemplaza los números por palabras)
  enum :status, { scheduled: 0, in_progress: 1, completed: 2, cancelled: 3 }

  # Scopes
  scope :upcoming, -> { where('date > ?', Time.current).where.not(status: :cancelled).order(date: :asc) }
  scope :past, -> { where('date <= ? OR status = ?', Time.current, Appointment.statuses[:cancelled]).order(date: :desc) }

  # Validations
  validates :date, :reason, :pet, :vet, :status, presence: true
  validate :date_cannot_be_in_the_past, on: :create

  private

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end