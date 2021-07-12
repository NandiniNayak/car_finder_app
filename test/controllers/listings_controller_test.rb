require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { buyer_id: @listing.buyer_id, car_type: @listing.car_type, description: @listing.description, fuel_type: @listing.fuel_type, make: @listing.make, picture: @listing.picture, price: @listing.price, profile_id: @listing.profile_id, seller_id: @listing.seller_id, title: @listing.title } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { buyer_id: @listing.buyer_id, car_type: @listing.car_type, description: @listing.description, fuel_type: @listing.fuel_type, make: @listing.make, picture: @listing.picture, price: @listing.price, profile_id: @listing.profile_id, seller_id: @listing.seller_id, title: @listing.title } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
