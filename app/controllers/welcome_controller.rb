class WelcomeController < ApplicationController

  def index
    swanson_quote = SwansonQuoteService.get_quote
    if swanson_quote.nil?
      @quote = {quote: '', rating: ''}
    else
      @quote = {quote: swanson_quote.quote, rating: swanson_quote.quote_ratings.get_avg, did_rate: swanson_quote.quote_ratings.did_rate?(request.remote_ip) }
    end
  end
end
