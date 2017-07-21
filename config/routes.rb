Rails.application.routes.draw do
  scope :api do
    resources :legs
    resources :comments
    resources :trips
    resources :users
  end
end
