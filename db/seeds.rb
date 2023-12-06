Airport.delete_all
puts "started seeding..."
Airport.create(code:"YUL", name:"Montréal-Pierre Elliott Trudeau International Airport", city:"Montreal", country:"Canada")
Airport.create(code: 'SFO', name: 'San Francisco International Airport', city: 'San Francisco', country: 'United States')
Airport.create(code: 'JFK', name: 'John F. Kennedy International Airport', city: 'New York', country: 'United States')
Airport.create(code: 'LAX', name: 'Los Angeles International Airport', city: 'Los Angeles', country: 'United States')
Airport.create(code: 'PIT', name: 'Pittsburgh International Airport', city: 'Pittsburgh', country: 'United States')
Airport.create(code: 'SAN', name: 'San Diego International Airport', city: 'San Diego', country: 'United States')
Airport.create(code: 'DTW', name: 'Detroit Metropolitan Airport', city: 'Detroit', country: 'United States')
Airport.create(code: 'ORD', name: 'O\'hare International Airport', city: 'Chicago', country: 'United States')
Airport.create(code: 'SLC', name: 'Salt Lake City International Airport', city: 'Salt Lake City', country: 'United States')
Airport.create(code: 'DFW', name: 'Dallas / Fort Worth International Airport', city: 'Dallas', country: 'United States')
Airport.create(code: 'SEA', name: 'Seattle-Tacoma International Airport', city: 'Seattle', country: 'United States')
Airport.create(code: 'BOS', name: 'Logan International Airport', city: 'Boston', country: 'United States')
puts "seeding was successful!"