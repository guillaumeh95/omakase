class TripMailer < ApplicationMailer
  def send_trip(trip)
    @trip = trip
    mail(
          to:       @trip.tourist_email,
          subject:  "#{@trip.host.first_name.capitalize} sent you a new trip! [#{trip.date.strftime('%A %B %e, %Y')}]"
        )
  end
end
