class WelcomeController < ApplicationController

  def index
    swanson_quote = SwansonQuoteService.get_quote
    puts swanson_quote
    if swanson_quote.nil?
      @quote = {quote: '', rating: ''}
    else
      @quote = {quote: swanson_quote.quote, rating: swanson_quote.quote_ratings.get_avg }
    end
  end
end
