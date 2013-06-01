#coding: utf-8
require 'sinatra'
require 'haml'
require 'sinatra/reloader'

set :bind, '0.0.0.0'

get '/' do
  haml :index
end

get '/video' do
  haml :video
end

get '/character' do
    meigen = []
    lines = 0

    open("meigen.txt") { |file|
        while line = file.gets
            meigen << line
            lines += 1
        end
    }

    @meigen = meigen[rand(lines - 1)]
    haml :character
end

get '/randomjump' do
    randomjump = rand(2)

    if randomjump == 0
        redirect '/video'
    else
        redirect '/character'
    end
end
