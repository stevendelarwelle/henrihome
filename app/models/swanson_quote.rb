class SwansonQuote < ApplicationRecord
  validates :quote, presence: true
  has_many :quote_ratings

  def self.rate(quote, user_ip, rating)
    the_quote = self.find_by(quote: quote)
    rated = QuoteRating.where(swanson_quote_id: the_quote.id, ip_address: user_ip).exists?
    unless rated
      QuoteRating.create(swanson_quote_id: the_quote.id, ip_address: user_ip, rating: 1)
    end
    the_quote.quote_ratings.get_avg
  end

end
