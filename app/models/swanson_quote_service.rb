class SwansonQuoteService
  include HTTParty
  def initialize
    @quote = get_quote
  end
  def get_quote
      begin
        #we get a random quote from ron-swanson_quotes
        response = HTTParty.get('https://ron-swanson-quotes.herokuapp.com/v2/quotes')

        return JSON.parse(response.body)[0]

      rescue HTTParty::Error
        return nil
        # don´t do anything we handle this in the controller
      rescue StandardError
        return nil
        # don´t do anything we handle this in the controller
      end
  end
  def quote
    @quote
  end
end