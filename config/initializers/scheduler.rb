require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton

return if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'

# Stupid recurrent task...
#
s.every '24h' do
  Crawler::KnoxPunkJob.perform_later
end