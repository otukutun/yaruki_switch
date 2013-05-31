#coding: utf-8
require 'sinatra'
require 'haml'

set :bind, '0.0.0.0'

get '/' do
  haml :index
end

#get '/post' do
#  haml :index
#end
