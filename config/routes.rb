Rails.application.routes.draw do
  root 'pokemon#index'
  get '/search', to: 'pokemon#show'
end
