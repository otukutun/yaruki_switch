#coding: utf-8
require 'sinatra'
require 'haml'

set :bind, '0.0.0.0'

get '/' do
  #'Hello Worldaaaa'
  haml :index
end
