require 'rspotify'

get '/' do
  erb :'/show'
end

post '/playlists' do
  RSpotify.authenticate(ENV["SPOTIFY_TOKEN"], ENV["SPOTIFY_SECRET_TOKEN"])

  mood_list = RSpotify::Playlist.search(params[:mood])

    if mood_list != []
      @uri = mood_list.sample.uri
    else
      artist = 'Cher'
      @uri = RSpotify::Artist.search(artist).sample.uri
    end
  if request.xhr?
    erb :'/_spotify', layout: false, locals: {uri: @uri}
  else
    erb :'/show'
  end

end
