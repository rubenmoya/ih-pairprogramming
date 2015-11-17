Rails.application.routes.draw do

  get '/new' => 'links#new'
  post('/new', :to => 'links#create')

  get '/links/:link_id' => 'links#show'

  get '/:shortlink' => 'links#redirect'
end
