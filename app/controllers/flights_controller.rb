class FlightsController < ApplicationController
    def index
        @airport_options = Airport.all.map { |ap| [ap.name, ap.id] }
        @date_options = Flight.all.map { |flight| [flight.date, flight.date]}.uniq
    end
end
