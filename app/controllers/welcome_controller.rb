class WelcomeController < ApplicationController

  def index
    swanson_quote_service = SwansonQuoteService.new
    puts swanson_quote_service.to_yaml
    if swanson_quote_service.quote.nil?
      @quote = {quote: '', rating: ''}
    else
      swanson_quote = SwansonQuote.find_or_create_by(quote: swanson_quote_service.quote)
      @quote = {quote: swanson_quote.quote, rating: swanson_quote.quote_ratings.get_avg, did_rate: swanson_quote.quote_ratings.did_rate?(request.remote_ip) }
    end
  end
end
