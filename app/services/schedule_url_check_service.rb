# frozen_string_literal: true

# Remote schedule check url
class ScheduleUrlCheckService

  def initialize(url)
    @url = url
  end

  WORKER_NAME = 'Broolik::Worker::Sample'

  def perform
    url = Url.create!(url: @url, processed: false)
    Sidekiq::Client.push('class' => WORKER_NAME, 'args' => [url.id, 3], 'queue' => 'worker.cr')
  end
end
