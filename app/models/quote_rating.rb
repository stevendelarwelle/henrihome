class QuoteRating < ApplicationRecord
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}, presence: true
  validates :ip_address, presence: true
  belongs_to :swanson_quote

  def self.get_avg
    self.count > 0 ? self.sum(:rating) / self.count : 0
  end
end
