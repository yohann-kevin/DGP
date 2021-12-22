class DiscordService
  def initialize(message)
    @message = message
  end

  def send_message
    url = "https://discord.com/api/webhooks/923295093501333555/HWD3cfFuh9DHLXx3L9hMjjSu5hRAgZ5bO_mvlfkzQlXrU2uunBnf614iGA_vQjGIbxsA"
    client = Discordrb::Webhooks::Client.new(url: url)
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
