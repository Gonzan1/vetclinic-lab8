class Owner < ApplicationRecord
  has_many :pets

  # Callbacks
  before_validation :normalize_email

  # Validations
  validates :first_name, :last_name, :phone, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end