Rails.application.routes.draw do

  get 'darksky/weather'
  scope :api do

    post 'oauth/facebook'
    get 'weather', to: 'darksky#weather'
    get 'budget', to: 'budget_your_trip#budget'

    resources :legs
    resources :comments
    resources :trips
    resources :users


    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
  end
end
