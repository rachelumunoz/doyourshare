require 'test_helper'

class LocationRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_rating = location_ratings(:one)
  end

  test "should get index" do
    get location_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_location_rating_url
    assert_response :success
  end

  test "should create location_rating" do
    assert_difference('LocationRating.count') do
      post location_ratings_url, params: { location_rating: { email: @location_rating.email, lat: @location_rating.lat, long: @location_rating.long, rating: @location_rating.rating } }
    end

    assert_redirected_to location_rating_url(LocationRating.last)
  end

  test "should show location_rating" do
    get location_rating_url(@location_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_rating_url(@location_rating)
    assert_response :success
  end

  test "should update location_rating" do
    patch location_rating_url(@location_rating), params: { location_rating: { email: @location_rating.email, lat: @location_rating.lat, long: @location_rating.long, rating: @location_rating.rating } }
    assert_redirected_to location_rating_url(@location_rating)
  end

  test "should destroy location_rating" do
    assert_difference('LocationRating.count', -1) do
      delete location_rating_url(@location_rating)
    end

    assert_redirected_to location_ratings_url
  end
end
