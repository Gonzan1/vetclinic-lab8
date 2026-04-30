class Owner < ApplicationRecord
  has_many :pets

  # Callbacks
  before_validation :normalize_email

  # Validations
  validates :first_name, :last_name, :phone, :address, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end