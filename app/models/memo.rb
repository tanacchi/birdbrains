class Memo < ApplicationRecord
  validates :title, length: {maximum: 30}
  belongs_to :user
end
