class ServicesController < ApplicationController

  def get_quote
    swanson_quote_service = SwansonQuoteService.new

    if swanson_quote_service.quote.nil?
      render :status => 400
    else
      swanson_quote = SwansonQuote.find_or_create_by(quote: swanson_quote_service.quote)
      render :json => {quote: swanson_quote.quote, rating: swanson_quote.get_average_rating, did_rate: swanson_quote.quote_ratings.did_rate?(request.remote_ip)}
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
