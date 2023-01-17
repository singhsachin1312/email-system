Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/admin', to: 'users#index'
  root "users#index"
  resources :users do 
  get 'verify_email_address', on: :member
  get "remainder", to: "users#new_remainder"
  post "remainder"
  end
end
