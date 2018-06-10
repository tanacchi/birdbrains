class Memo < ApplicationRecord
  validates :title, length: {maximum: 30}
  belongs_to :user

  before_create :set_made_time
  before_save :set_updated_time

  private
  def set_made_time
    self.made_time = DateTime.now
  end

  def set_updated_time
    self.updated_time = DateTime.now
  end
end
