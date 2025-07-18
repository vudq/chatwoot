class Webhooks::FacebookCommentsJob < MutexApplicationJob
  queue_as :default
  retry_on LockAcquisitionError, wait: 1.second, attempts: 8

  def perform(feed_event)
    puts "Processing Facebook comment event: #{feed_event}"
  end