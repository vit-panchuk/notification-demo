# Notification Demo

This is a proof of concept app with [Wisper](https://github.com/krisleech/wisper) and ActiveCable to show that we can organize our Notifications with Publish/Subscribe pattern using Wisper and we will be able to add ActiveCable in future if we want.

## Procs

* We can better organize our notifications with Pub/Sub
* Wisper can handle all our Pub/Sub needs
* Wisper has Sidekiq connector to perform events async (it's fully encapsulated, we don't need to write workers)
* As you can see, there are no problems to use it with ActiveCable.

## Files

* `app/models/notification.rb` - a model that persists a Notification entity
* `app/channels/notification_channel.rb` - an ordinary ActiveCable's channel, streams notifications
* `app/assets/javascripts/channels/notification.coffee` - just `alert`s notification content when gets a notification
* `app/controllers/dashboard_controller.rb` - an controller with one ujs action that broadcasts `'call_notification'` event to Wisper event bus (it's possible because the controller includes `Wisper::Publisher`)
* `app/subscribers/notification_subscriber.rb` - a module with `.call_notification` which creates random `Notification` entity and broadcasts it to ActiveCable's `NotificationChannel`
* `config/initializers/wisper.rb` - global level NotificationSubscriber's subscription to Wisper event bus.