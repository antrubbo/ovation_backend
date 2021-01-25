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

#  Exmple url "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&q=kid%20cudi%20live&key=AIzaSyDm0mYxB4CI2wZWva9b53HumoXnKvfeMMY
# "
Artist.destroy_all
User.destroy_all
Event.destroy_all
Ticket.destroy_all


#Creating Users 
3.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, picture: "https://t3.ftcdn.net/jpg/03/61/60/30/360_F_361603010_gIFE6Gf1MrO2Y2MJ5E8WfJ2I00GKvlzR.jpg"  )
end

# artist_songkick_ids = {
#     "Phoebe Bridgers": 3822376,
#     "Jason Isbell and the 400 Unit": 190529,
#     "The Weeknd": 4363463,
#     "The Killers": 555021,
#     "Kendrick Lamar": 3277856,
# }

#creating artists
phoebe = Artist.create(
    name:"Phoebe Bridgers",
    song_kick_id: 3822376,
    description: "Phoebe Lucille Bridgers (born August 17, 1994)[1] is an American singer-songwriter, guitarist and producer from Los Angeles, California. Best known for her work as a solo artist, she is also known for being part of the musical groups boygenius (with Julien Baker and Lucy Dacus) and Better Oblivion Community Center (with Conor Oberst).",
    genre: "Indie Rock",
    picture: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Phoebe_Bridgers_%2841599189180%29_%28cropped%29.jpg",
    past_performances: [
        "https://www.youtube.com/watch?v=2bOigld3D1k",
        "https://www.youtube.com/watch?v=fLYlYwoqeFI",
        "https://www.youtube.com/watch?v=GSZFJ2_j81w"
    ]
)

jason = Artist.create(
    name:"Jason Isbell and the 400 Unit", 
    song_kick_id: 190529,
    description: "Former member of Drive-By-Truckers, singer-songwriter Jason Isbell (born February 1st, 1979) went solo in 2007, forging a sound that is instilled with a rootsy, southern swagger, whilst also offering country ballads full of melancholy and themes of redemption.",
    genre: "Alt-Country/Rock",
    picture: "https://mediad.publicbroadcasting.net/p/shared/npr/styles/x_large/nprshared/201811/530279081.jpg",
    past_performances: [
        "https://www.youtube.com/watch?v=fs2JLLqh91A",
        "https://www.youtube.com/watch?v=31mWelcliRs",
        "https://www.youtube.com/watch?v=r3Mc9YgnBm8"
    ]
)
weeknd = Artist.create(
    name: "The Weeknd",  
    song_kick_id: 4363463, 
    description: "Abel Makkonen Tesfaye (born February 16, 1990), known professionally as the Weeknd, is a Canadian singer, songwriter, and record producer.[1] Noted for his falsetto and eccentric music style,[2][3] Tesfaye is recognized for heavily influencing contemporary R&B and multiple artists.",
    genre: "R&B",
    picture: "https://www.biography.com/.image/c_fit%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_620/MTU3NTY4MjczNjAzMzcyOTM5/the-weeknd.jpg",
    past_performances: [
        "https://www.youtube.com/watch?v=R4m35Wk_-Zk",
        "https://www.youtube.com/watch?v=mAcQRgPWZDE",
        "https://www.youtube.com/watch?v=4H7imo5pG94"
    ]
)
killers = Artist.create(
    name:"The Killers", 
    song_kick_id: 555021,
    description: "The Killers are an American rock band formed in Las Vegas in 2001 by Brandon Flowers and Dave Keuning. Since 2002, the band's official lineup has consisted of Flowers, Keuning, Mark Stoermer and Ronnie Vannucci Jr., the latter two having joined the band that year.",
    genre: "Rock/Alternative",
    picture: "https://i.scdn.co/image/c85f1ea9f92dc0cc43965a0c727c4a1cdd1c2540",
    past_performances: [
        "https://www.youtube.com/watch?v=IdWZgTvf4t0",
        "https://www.youtube.com/watch?v=QVlfINuDdKE",
        "https://www.youtube.com/watch?v=8ocHoTqm-J4"
    ]
)

kendrick = Artist.create(
    name:"Kendrick Lamar", 
    song_kick_id: 3277856,
    description: "Kendrick Lamar Duckworth (born June 17, 1987) is an American rapper, songwriter, and record producer. Since his mainstream debut in 2012 with Good Kid, M.A.A.D. City, Lamar has been regarded as one of the most influential artists of his generation, as well as one of the greatest rappers and lyricists of all time.",
    genre: "Hip-Hop",
    picture: "https://resources.tidal.com/images/84ea0dbb/00c7/481f/aaf3/c75ce57f0283/750x750.jpg",
    past_performances: [
        "https://www.youtube.com/watch?v=sop2V_MREEI",
        "https://www.youtube.com/watch?v=g5Jgy-33t-M",
        "https://www.youtube.com/watch?v=BTvV9JyNaS8"
    ]
)

# Creating events after API call 
def create_event(api_data, artist_id) 
    
    i=0
    display_names = []
    uris = []
    dates = []
    times = []

    api_data.each do |key, value|
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

    loop_times = 5 

    if display_names.length < loop_times 
        loop_times = display_names.length
    end 
 
    loop_times.times do 
        Event.create(name: display_names[i], event_url: uris[i], date: dates[i], time: times[i], artist_id: artist_id)
        # byebug
        i += 1
    end 

end 

#Making the api call 
def make_api_call 
    
    #For each songkick Id we want to pass the id into the url
    #  parse the response,
    #Send it to our create_event method 
    Artist.all.each do |artist|
        request = RestClient.get("https://api.songkick.com/api/3.0/artists/#{artist.song_kick_id}/calendar.json?apikey=zIDG2c72WHINjQ8Y")
        artist_data = JSON.parse(request)
        create_event(artist_data, artist.id)
    end 
    
end 

#Make the api call 
make_api_call
