class QuoteRating < ApplicationRecord
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}, presence: true
  validates :ip_address, presence: true
  belongs_to :swanson_quote

  def self.get_avg
    #get the average
    self.count > 0 ? (self.sum(:rating)/ self.count).to_s : '0.0'
  end
  def self.did_rate?(ip)
    #check if this ip rated this quote
    self.where(ip_address: ip).exists?
  end
end
