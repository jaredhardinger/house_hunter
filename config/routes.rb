Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/agents', to: 'agents#index'
end
