class Ticket < ApplicationRecord
  belongs_to :base_station,  class_name: "RailwayStation"
  belongs_to :final_station, class_name: "RailwayStation"
  belongs_to :train
  belongs_to :user

  validates :passenger, presence: true
  validate :valid_route

  after_create  :send_buy_notification
  after_destroy :send_destroy_notification

  def arrival_time
    final_station.arrival_time_in(train.route)
  end

  def departure_time
    base_station.departure_time_in(train.route)
  end

  def route_name
    "#{base_station.title} - #{final_station.title}"
  end

  protected

  def valid_route
    return if train.route.pass_through?(base_station, final_station)
    errors.add :base, "Train's №#{train.number} route must pass through " \
      "#{base_station} and #{final_station}"
  end

  private

  def send_buy_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_destroy_notification
    TicketsMailer.destroy_ticket(user, self).deliver_now
  end
end
