Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/agents/:id', to: 'agents#show'
  get '/agents', to: 'agents#index'
  get '/houses/:id', to: 'houses#show'
  get '/houses', to: 'houses#index'
end
