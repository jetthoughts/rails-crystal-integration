# frozen_string_literal: true

# Remote schedule check url
class ScheduleUrlCheckService

  def initialize(url)
    @url = url
  end

  def perform
    Sidekiq::Client.push(
      'class' => 'Broolik::Worker::URLChecker',
      'args' => [@url],
      'queue' => 'worker.cr'
    )
  end
end
