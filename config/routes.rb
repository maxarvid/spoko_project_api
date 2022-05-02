Rails.application.routes.draw do
namespace :api do
  resources :products, only: %i[index]
end
end