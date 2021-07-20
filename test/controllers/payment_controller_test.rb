require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get payment_page_url
    assert_response :success
  end

end
