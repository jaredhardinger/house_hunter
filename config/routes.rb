Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/agents/new', to: 'agents#new'
  get '/agents/:agent_id/houses', to: 'agent_houses#index'
  get '/agents/:id', to: 'agents#show'
  get '/agents', to: 'agents#index'
  get '/houses/:id', to: 'houses#show'
  get '/houses', to: 'houses#index'
  post '/agents', to: 'agents#create'
end
