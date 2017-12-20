env :PATH, ENV['PATH']
set :environment, 'development'
set :output, "#{path}/log/cron.log"
every 10.minutes do
  runner "DatabaseHandler.get_post"
end

