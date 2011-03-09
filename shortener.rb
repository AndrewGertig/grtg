#This is the "Sinatra Application"

$LOAD_PATH << File.join(Dir.getwd, 'lib')

require 'rubygems'
require 'sinatra'
require 'shorten' #This is from the lib folder we created, the shorten library is from the screencast

before do 
  @shorten = Shortener.load #What is Shortener?
end

get "/" do
  erb :home
end

post '/shorten' do
  #params.inspect #This shows us what we get in the params
  url = @shorten.shorten(params['url'])
  redirect "/info/#{url.hash}"
end

get '/info/:hash' do
  url = @shorten.lookup(params[:hash])
  erb :shortened, :local => {:url => url}
end