desc "Send message on discord channel"
task discord_post: :environment do
  DiscordService.new("plop").send_message
end
