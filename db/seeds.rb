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
        "https://www.youtube.com/watch?v=ewfdRy5jfF8",
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

gaga = Artist.create(
    name:"Lady Gaga", 
    song_kick_id: 974908,
    description: "Stefani Joanne Angelina Germanotta, known professionally as Lady Gaga, is an American singer, songwriter, and actress. She is known for her consistent image reinventions and versatility in both music and entertainment.",
    genre: "Pop",
    picture: "https://ca-times.brightspotcdn.com/dims4/default/6cc152f/2147483647/strip/true/crop/2048x1151+0+0/resize/840x472!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fd2%2F35%2F29b7ac6fbd0df6c16ced1776cc24%2Fla-1535430818-py4nyenox5-snap-image",
    past_performances: [
        "https://www.youtube.com/watch?v=NCEcWA0wy_E",
        "https://www.youtube.com/watch?v=5D4vjndnB0w",
        "https://www.youtube.com/watch?v=q3ues1stefk"
    ]
)

bieber = Artist.create(
    name:"Justin Bieber", 
    song_kick_id: 2596951,
    description: "Justin Drew Bieber is a Canadian singer, songwriter and multi-instrumentalist. Discovered at age 13 by talent manager Scooter Braun after he had watched Bieber's YouTube cover song videos, Bieber was signed to RBMG Records in 2008.",
    genre: "Pop",
    picture: "https://lh3.googleusercontent.com/pW7Jv2o8g0bkXFi11hrumm_N0e7KAf5pc5bawoSdD44uTLAYQi-Eeh1t1HileeiMx-9pXN6hQROW-OBEzWQWcEs2",
    past_performances: [
        "https://www.youtube.com/watch?v=djzDWMy1z7k",
        "https://www.youtube.com/watch?v=ZAFgWhzvivM",
        "https://www.youtube.com/watch?v=ITAkDYJDsS4"
    ]
)

queen = Artist.create(
    name:"Queen + Adam Lambert", 
    song_kick_id: 469904,
    description: "Queen are a British rock band formed in London in 1970. Their classic line-up was Freddie Mercury, Brian May, Roger Taylor and John Deacon, now fronted by Adam Lambert.",
    genre: "Rock",
    picture: "https://i.ytimg.com/vi/kgQzrUwFfNg/maxresdefault.jpg",
    past_performances: [
        "https://www.youtube.com/watch?v=eH5aH2F4BaM",
        "https://www.youtube.com/watch?v=qvbhfrwldEs",
        "https://www.youtube.com/watch?v=odtNNiIzv1k"
    ]
)

saves = Artist.create(
    name:"Saves The Day", 
    song_kick_id: 398681,
    description: "Saves The Day are an American band signed to Vagrant Records. The band are known for their: emo, pop punk and indie rock music.",
    genre: "Rock",
    picture: "https://www.rollingstone.com/wp-content/uploads/2019/10/saves-the-day.jpeg",
    past_performances: [
        "https://www.youtube.com/watch?v=Kbvp5z_aIXY",
        "https://www.youtube.com/watch?v=23ugXw284lU",
        "https://www.youtube.com/watch?v=O7-EwoezhUc"
    ]
)

leon = Artist.create(
    name:"Kings of Leon", 
    song_kick_id: 2847,
    description: "Kings of Leon (formed in 2000) is an American alternative family rock band hailing from Nashville, Tennessee, in the U.S.",
    genre: "Rock",
    picture: "https://images.sk-static.com/images/media/img/col6/20160826-192622-585983.jpg",
    past_performances: [
        "https://www.youtube.com/watch?v=lKeUCkBO8QA",
        "https://www.youtube.com/watch?v=j6pcQb55G2Q",
        "https://www.youtube.com/watch?v=E1y9-7EUIg0"
    ]
)
tom = Artist.create(
    name:"Tom Misch", 
    song_kick_id: 8341698,
    description: "Thomas Abraham Misch is an English musician and producer. He began releasing music on SoundCloud in 2012 and released his debut studio album Geography in 2018. In 2020, he released his second studio album What Kinda Music in collaboration with English jazz drummer Yussef Dayes, distributed through Blue Note Records.",
    genre: "Funk/Jazz/Neo-Soul",
    picture: "https://www.jazzavienne.com/sites/jazzavienne/files/styles/field_visuel_principal_contenu/public/thumbnails/image/tom_misch_tunnel.png?itok=yAdxLb3N",
    past_performances: [
        "https://www.youtube.com/watch?v=X_1cgHy4M7E",
        "https://www.youtube.com/watch?v=IUMTaAQ43lY",
        "https://www.youtube.com/watch?v=Lox1eHqvEzI"
    ]
)

# Creating events after API call 
def create_event(api_data, artist_id) 
    
    i=0
    display_names = []
    uris = []
    dates = []
    times = []
    locations = []

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
                            if k4 === "location"
                                v4.each do |k5, v5|
                                    if k5 === "city"
                                        locations << v5
                                    end 
                                end 
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
        Event.create(name: display_names[i], location: locations[i], event_url: uris[i], date: dates[i], time: times[i], artist_id: artist_id)
        i += 1
    end 

end 

#Making the api call 

def make_api_call 
    Artist.all.each do |artist|
        request = RestClient.get("https://api.songkick.com/api/3.0/artists/#{artist.song_kick_id}/calendar.json?apikey=zIDG2c72WHINjQ8Y")
        artist_data = JSON.parse(request)
        create_event(artist_data, artist.id)
    end 
    
end 

make_api_call