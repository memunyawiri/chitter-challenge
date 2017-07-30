require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(name: params[:name], handle: params[:handle], post: params[:post])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
