Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index", as: :home
  resources :announcements, only: [:index, :create, :update]
  get "/anncs" => "announcements#show", as: :anncs
  get "/anncs/add" => "announcements#new", as: :new_announcement
  get "/anncs/delete" => "announcements#destroy", as: :delete_announcement
end
