class Event < ApplicationRecord
  has_many :tickets, dependent: :delete_all 
  belongs_to :user
  has_many :attending_users,
    through: :tickets,
    source: :user

  validates :title, presence: true, uniqueness: true
end
