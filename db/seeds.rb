require 'faker'
require 'json'
require 'rest-client'
require 'byebug'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# for API response - description(displayName), start[date][time]

Artist.destroy_all
User.destroy_all
Event.destroy_all
Ticket.destroy_all

response = RestClient.get("https://api.songkick.com/api/3.0/artists/3822376/calendar.json?apikey=zIDG2c72WHINjQ8Y", 
{per_page: 2})
data = JSON.parse(response)

def create_event(some_data) 
    
    display_names = []
    uris = []
    dates = []
    times = []

    some_data.each do |key, value|
        value.each do |k2, v2|
            if k2 == "results"
                v2.each do |k3, v3|
                    v3.each do |results|
                        results.each do |k4, v4|
                            if k4 === "displayName"
                                display_names << v4
                            end 
                            if k4 === "uri"
                                uris << v4
                            end 
                            if k4 === "start" 
                                v4.each do |k5, v5|
                                    if k5 === "date"
                                        dates << v5
                                    end 
                                    if k5 === "time"
                                        if v5 === nil
                                            times << "TBA"
                                        else
                                            times << v5
                                        end
                                    end 
                                end 
                            end 
                        end 
                    end 
                end    
            end 
        end 
    end 
    

end 

create_event(data)

artist_ids = {
    "Phoebe Bridgers": 3822376
}

3.times do
    User.create(name: Faker::name, email: Faker::Internet.email, picture: "https://t3.ftcdn.net/jpg/03/61/60/30/360_F_361603010_gIFE6Gf1MrO2Y2MJ5E8WfJ2I00GKvlzR.jpg"  )
end


# api_resp = RestClient.get("https://api.songkick.com/api/3.0/artists/{artist_id}/calendar.json?apikey={your_api_key}")
# api_data = JSON.parse(api_resp)