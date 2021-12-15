require "test_helper"

class GalacticPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @galactic_picture = galactic_pictures(:one)
  end

  # test "should get index" do
  #   get galactic_pictures_url, as: :json
  #   assert_response :success
  # end

  # test "should create galactic_picture" do
  #   assert_difference('GalacticPicture.count') do
  #     post galactic_pictures_url, params: { galactic_picture: { copyright: @galactic_picture.copyright, date: @galactic_picture.date, description: @galactic_picture.description, download: @galactic_picture.download, hd_url: @galactic_picture.hd_url, media_type: @galactic_picture.media_type, title: @galactic_picture.title, to_like: @galactic_picture.to_like, url: @galactic_picture.url } }, as: :json
  #   end

  #   assert_response 201
  # end

  # test "should show galactic_picture" do
  #   get galactic_picture_url(@galactic_picture), as: :json
  #   assert_response :success
  # end

  # test "should update galactic_picture" do
  #   patch galactic_picture_url(@galactic_picture), params: { galactic_picture: { copyright: @galactic_picture.copyright, date: @galactic_picture.date, description: @galactic_picture.description, download: @galactic_picture.download, hd_url: @galactic_picture.hd_url, media_type: @galactic_picture.media_type, title: @galactic_picture.title, to_like: @galactic_picture.to_like, url: @galactic_picture.url } }, as: :json
  #   assert_response 200
  # end

  # test "should destroy galactic_picture" do
  #   assert_difference('GalacticPicture.count', -1) do
  #     delete galactic_picture_url(@galactic_picture), as: :json
  #   end

  #   assert_response 204
  # end
end
