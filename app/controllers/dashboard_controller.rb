class DashboardController < ApplicationController
  include Wisper::Publisher

  def index; end

  def call_notification
    broadcast(:call_notification)
  end
end
