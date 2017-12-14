class TripMailer < ApplicationMailer
  def send_trip(trip)
    @trip = trip
    @date_from = trip.date.strftime("%Y%m%d")
    @date_to = (trip.date.to_datetime + 1).strftime("%Y%m%d")
    mail(
          to:       @trip.tourist_email,
          subject:  "#{@trip.host.first_name.capitalize} sent you a new trip! [#{trip.date.strftime('%A %B %e, %Y')}]"
        )
  end
end
