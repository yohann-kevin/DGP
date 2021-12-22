class DiscordService
  def initialize(message)
    @message = message
  end

  def send_message
    client = Discordrb::Webhooks::Client.new(url: ENV["DISCORD_WEBHOOK"])
    client.execute do |builder|
      builder.content = "Scheduler run !"
      builder.add_embed do |embed|
        embed.title = "Daily Galactic Picture"
        embed.description = @message
        embed.timestamp = Time.zone.now
      end
    end
  end
end
