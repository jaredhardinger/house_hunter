Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/agents/:id', to: 'agents#show'
  get '/agents', to: 'agents#index'
end
