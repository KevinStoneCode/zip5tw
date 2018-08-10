Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'zip5#query'
  get  '/about',   to: 'static_pages#about'
  get '/zip5'         , to:'zip5#query'
  get '/zip5/:address', to:'zip5#query'
  post '/zip5', to:'zip5#query'
end
