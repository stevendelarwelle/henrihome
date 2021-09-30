require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get get_quote" do
    get services_get_quote_url
    assert_response :success
  end

end
