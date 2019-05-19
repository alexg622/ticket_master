class User < ApplicationRecord
  has_many :events, dependent: :delete_all
  has_many :tickets, dependent: :delete_all 

  has_many :upcoming_events,
    through: :tickets,
    source: :event

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
