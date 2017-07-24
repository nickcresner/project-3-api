Rails.application.routes.draw do


  scope :api do
    post 'oauth/facebook'

    resources :legs
    resources :comments
    resources :trips
    resources :users


    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
  end
end
