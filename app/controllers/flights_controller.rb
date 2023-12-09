class FlightsController < ApplicationController
    def index
        puts "****started flights page*****"
        puts params
        @flights = Flight.all
        @airport_options = Airport.all.map { |ap| [ap.name, ap.id] }
        @date_options = Flight.all.map { |flight| [flight.date, flight.date]}.uniq
        
        if search_params.present?
            where_conditions = []
            where_conditions << "arrival_airport_id = :arrival_airport_id" if search_params[:arrival_airport_id].present?
            where_conditions << "departure_airport_id = :departure_airport_id" if search_params[:departure_airport_id].present?
            where_conditions << "date = :flight_date" if search_params[:flight_date].present?
            where_clause = where_conditions.join(" AND ")
            @flights = Flight.where(where_clause,
            arrival_airport_id: search_params[:arrival_airport_id],
            departure_airport_id: search_params[:departure_airport_id],
            flight_date: search_params[:flight_date])
        end
    end

    private

    def search_params
        params.permit(:arrival_airport_id, :departure_airport_id, :flight_date)
    end
end
