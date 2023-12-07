
Flight.delete_all
Airport.delete_all
puts "started seeding airports..."
Airport.create(code: 'YUL', name: 'Montréal-Pierre Elliott Trudeau International Airport', city: 'Montreal', country: 'Canada')
Airport.create(code: 'YEG', name: 'Edmonton International Airport', city: 'Edmonton', country: 'Canada')
Airport.create(code: 'YYZ', name: 'Toronto Pearson International Airport', city: 'Toronto', country: 'Canada')
Airport.create(code: 'YYC', name: 'Calgary International Airport', city: 'Calgary', country: 'Canada')
Airport.create(code: 'YVR', name: 'Vancouver International Airport', city: 'Vancouver', country: 'Canada')
puts "seeding airports was successful!"


DURSTIONS = {'YUL' => {'YEG' => 290, 'YYZ' => 95, 'YYC' => 290, 'YVR' => 345}, 
             'YEG' => {'YYZ' => 230, 'YYC' => 60, 'YVR' => 105}, 
             'YYZ' => {'YYC' => 265, 'YVR' => 315},
             'YYC' => {'YVR' => 100},
             'YVR' => {}}


def get_duration(apc1, apc2)            #APC: Airport Code
    unless DURSTIONS[apc1][apc2].nil?
        DURSTIONS[apc1][apc2]
    else
        DURSTIONS[apc2][apc1]
    end
end


puts "started seeding flights..."
start = Date.today
finish = Date.today + 30
airport_ids = Airport.all.pluck(:id)

(start..finish).each do |date|
    Airport.all.each do |ap|
        for ap2_id in airport_ids
            unless ap.id == ap2_id
                Flight.create(arrival_airport_id: ap.id, departure_airport_id: ap2_id, date: date, duration: get_duration(ap.code, Airport.find(ap2_id).code))
            end
        end
    end
end
puts "seeding flights was successful!"

