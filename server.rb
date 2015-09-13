require 'sinatra'
require 'pry'

get '/places' do
  places = File.readlines('places.txt')
  erb :index, locals: {places: places}
end

post '/places' do
  place = params['place']

  File.open('places.txt', 'a') do |file|
    file.puts("#{place}")
  end

  redirect '/places'
end
