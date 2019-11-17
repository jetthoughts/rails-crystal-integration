# frozen_string_literal: true

# Remote schedule check url
class ScheduleUrlCheckService

  def initialize(url)
    @url = url
  end

  WORKER_NAME = 'Broolik::Worker::URLChecker'

  def perform
    url = Url.create!(url: @url, processed: false)
    Sidekiq::Client.push('class' => WORKER_NAME, 'args' => [url.id], 'queue' => 'worker.cr')
  end
end
