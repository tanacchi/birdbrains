class User < ApplicationRecord
  validates :name,
            presence: true, length: { in: 3..20 },
            uniqueness: true
  
  has_many :memos
  has_many :notices
end
