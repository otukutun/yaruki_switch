#coding: utf-8
require 'sinatra'
require 'haml'
require 'sinatra/reloader'

set :bind, '0.0.0.0'

get '/' do

    meigen = []
    lines = 0

    open("meigen.txt") { |file|
        while line = file.gets
            meigen << line
            lines += 1
        end
    }

    print meigen[rand(lines - 1)]

    @meigen = meigen[rand(lines - 1)]
    haml :character

end
