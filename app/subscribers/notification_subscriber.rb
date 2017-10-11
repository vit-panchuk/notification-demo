module NotificationSubscriber
  def self.call_notification
    notification = Notification.create!(content: "Notification #{Random.rand}")
    NotificationChannel.broadcast_to('notification', content: notification.content)
  end
end