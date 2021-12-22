desc "Find daily galactic picture on nasa api"
task daily_picture: :environment do
  response = JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"))
  @galactic_picture = GalacticPicture.register_nasa_picture(response)
  @galactic_picture.id = SecureRandom.uuid
  msg = @galactic_picture.save ? "Image is register :)" : "An error as occured !"
  DiscordService.new(msg).send_message
  puts msg
end

desc "Find all galactic picture on nasa api"
task all_picture: :environment do
  response = JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}&start_date=2021-01-01"))
  response.each do |picture|
    galactic_picture = GalacticPicture.register_nasa_picture(picture)
    galactic_picture.id = SecureRandom.uuid
    msg = galactic_picture.save ? "Image is register :)" : "An error as occured !"
    puts msg
  end
end
