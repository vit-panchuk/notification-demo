class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notification:notification'
  end

  def unsubscribed; end
end
