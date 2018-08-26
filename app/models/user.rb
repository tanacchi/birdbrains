class User < ApplicationRecord
  validates :name,
            presence: true, length: { in: 3..20 },
            uniqueness: true
  
  has_many :memos, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :reminders, dependent: :destroy
end
