require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "creating a Listing" do
    visit listings_url
    click_on "New Listing"

    fill_in "Buyer", with: @listing.buyer_id
    fill_in "Car type", with: @listing.car_type
    fill_in "Description", with: @listing.description
    fill_in "Fuel type", with: @listing.fuel_type
    fill_in "Make", with: @listing.make
    fill_in "Picture", with: @listing.picture
    fill_in "Price", with: @listing.price
    fill_in "Profile", with: @listing.profile_id
    fill_in "Seller", with: @listing.seller_id
    fill_in "Title", with: @listing.title
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "updating a Listing" do
    visit listings_url
    click_on "Edit", match: :first

    fill_in "Buyer", with: @listing.buyer_id
    fill_in "Car type", with: @listing.car_type
    fill_in "Description", with: @listing.description
    fill_in "Fuel type", with: @listing.fuel_type
    fill_in "Make", with: @listing.make
    fill_in "Picture", with: @listing.picture
    fill_in "Price", with: @listing.price
    fill_in "Profile", with: @listing.profile_id
    fill_in "Seller", with: @listing.seller_id
    fill_in "Title", with: @listing.title
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing" do
    visit listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing was successfully destroyed"
  end
end
