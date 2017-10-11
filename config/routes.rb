Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard/call_notification' => 'dashboard#call_notification', as: :call_notification

  mount ActionCable.server => '/cable'
end
