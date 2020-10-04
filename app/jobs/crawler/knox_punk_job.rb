module Crawler
  class KnoxPunkJob < ApplicationJob
    include ActiveJob::Retry.new(
      strategy: :variable,
      delays: [30.seconds, 1.minute, 2.minutes, 5.minutes, 10.minutes, 30.minutes, 1.hour]
    )

    def perform
      ::Show::Crawler::KnoxPunk.new
    end
  end
end
