#coding: utf-8
require 'sinatra'
require 'haml'
#require 'sinatra/reloader'
require 'open-uri'
#require 'json'

set :bind, '0.0.0.0'

get '/' do
  haml :index
end

get '/video' do
  @ary = ["http://www.youtube.com/embed/H65kYmZ9JIM","http://www.youtube.com/embed/vc_UVpFayaw","http://www.youtube.com/embed/YbPWrtBSUHk","http://www.youtube.com/embed/vNCB4R3P2xE","http://www.youtube.com/embed/Iy9_9uJgRD0","http://www.youtube.com/embed/dqrklL0fUQk","http://www.youtube.com/embed/rlXXSLSLwS8","http://www.youtube.com/embed/DvGUxeJfvVo"]
  @ary2 = @ary[rand 8] << "?autoplay=1"
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

get '/about' do
  haml :about
end
