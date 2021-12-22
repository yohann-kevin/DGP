desc ""
task daily_picture: :environment do
  response = JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"))
  @galactic_picture = GalacticPicture.register_nasa_picture(response)
  @galactic_picture.id = SecureRandom.uuid

  if @galactic_picture.save
    puts "Image is register :)"
  else
    puts "An error as occured"
  end
end
