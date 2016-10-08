Rails.application.routes.draw do
  resources :haikus, only: [:new, :create, :show, :index]
end
