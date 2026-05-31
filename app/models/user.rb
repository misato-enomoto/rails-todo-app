class User < ApplicationRecord
  has_secure_password

  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  validates :email,
            presence: true,
            uniqueness: true

  validates :password,
            length: { minimum: 12 },
            if: -> { password.present? }
end
