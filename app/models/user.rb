class User < ApplicationRecord
  # Módulos de Devise por defecto
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { owner: 0, vet: 1, admin: 2 }

  # Validaciones de presencia
  validates :first_name, :last_name, presence: true
end