** Goal **

1. This app should allow a user to sign-in and have CRUD capabilities with the trips associated to them.
2. Within each trip, the user can view/add relevant details such as:
 - Calendar showing duration of trip and location across each day
 - Booking information (flights, hotels, activities, etc.)
 - Costs related to all aspects of the trip
 - Profiles for others attending same trip

*** Eventual Additions ***

3. Each trip should have a user designated as an admin that is able to make final edits on important trip details.
4. Trips marked as "public" should be visible to all users of the site
 - This would allow other users to get recommendations for a trip they may be planning


** Models **

1. User: username, email, password
 - has_many :trips
 -> Adding name, biography, location attributes

2. Trip: name, description, start_date, end_date, total_cost
 - belongs_to :user
 - has_many :activities, :flights, :accommodations, :companions
    -> May require a has_many, through for each

3. Activity: name, description, location, cost, start_date, end_date, start_time, end_time, booked (boolean)
 - belongs_to :trip

4. Flight: airline, flight_number, confirmation_number departure_location, arrival_location, departure_date, arrival_date, departure_time, arrival_time, checked_bags, cost, booked (boolean)
 - belongs_to :trip

5. Accommodation: name, type, location, arrival_date, departure_date, check_in_time, check_out_time, cost, booked
 - belongs_to :trip

6. Companions: confirmed
 - belongs_to :trip
 - has_many :users
