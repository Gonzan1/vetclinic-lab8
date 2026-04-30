class Treatment < ApplicationRecord
  belongs_to :appointment

  # Validations
  validates :name, :administered_at, :appointment, presence: true
  
end