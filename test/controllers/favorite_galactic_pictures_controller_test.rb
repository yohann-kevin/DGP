require "test_helper"

class FavoriteGalacticPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_galactic_picture = favorite_galactic_pictures(:one)
  end

  test "should get index" do
    get favorite_galactic_pictures_url, as: :json
    assert_response :success
  end

  test "should create favorite_galactic_picture" do
    assert_difference('FavoriteGalacticPicture.count') do
      post favorite_galactic_pictures_url, params: { favorite_galactic_picture: { galactic_picture_id: @favorite_galactic_picture.galactic_picture_id, user_id: @favorite_galactic_picture.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show favorite_galactic_picture" do
    get favorite_galactic_picture_url(@favorite_galactic_picture), as: :json
    assert_response :success
  end

  test "should update favorite_galactic_picture" do
    patch favorite_galactic_picture_url(@favorite_galactic_picture), params: { favorite_galactic_picture: { galactic_picture_id: @favorite_galactic_picture.galactic_picture_id, user_id: @favorite_galactic_picture.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy favorite_galactic_picture" do
    assert_difference('FavoriteGalacticPicture.count', -1) do
      delete favorite_galactic_picture_url(@favorite_galactic_picture), as: :json
    end

    assert_response 204
  end
end
