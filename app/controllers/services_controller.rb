class ServicesController < ApplicationController

  def get_quote
    swanson_quote = SwansonQuoteService.get_quote
    puts swanson_quote.quote_ratings.did_rate?(request.remote_ip)
    if swanson_quote.nil?
      render :status => 400
    else
      render :json => {quote: swanson_quote.quote, rating: swanson_quote.quote_ratings.get_avg, did_rate: swanson_quote.quote_ratings.did_rate?(request.remote_ip)}
    end
  end

  def rate_quote
    user_ip = request.remote_ip
    average_rating = SwansonQuote.rate(params['quote'], user_ip, params['rank'])
    if average_rating.nil?
      render :status => 400
    else
      render :json => {rating: average_rating}
    end
  end

end
