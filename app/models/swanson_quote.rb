class SwansonQuote < ApplicationRecord
  validates :quote, presence: true
  has_many :quote_ratings

  def self.rate(quote, user_ip, rating)
    #rate this quote
    the_quote = self.find_by(quote: quote)
    rated = the_quote.quote_ratings.did_rate?(user_ip)
    unless rated
      QuoteRating.create(swanson_quote_id: the_quote.id, ip_address: user_ip, rating: rating)
    end
    the_quote.quote_ratings.get_avg
  end

end
