class SwansonQuoteService
  include HTTParty

  def self.get_quote
      begin
        #we get a random quote from ron-swanson_quotes
        response = HTTParty.get('https://ron-swanson-quotes.herokuapp.com/v2/quotes')
        #quote_str = response.body.gsub('[', '').gsub(']', '').gsub('"', '')
        quote = JSON.parse(response.body)[0]
        swanson_quote = SwansonQuote.find_or_create_by(quote: quote)
        return swanson_quote
      rescue HTTParty::Error
        return nil
        # don´t do anything we handle this in the controller
      rescue StandardError
        return nil
        # don´t do anything we handle this in the controller
      end
  end
end