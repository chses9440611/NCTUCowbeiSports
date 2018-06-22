Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index", as: :home
  resources :announcements, only: [:index, :create, :update]
  get "/anncs" => "announcements#show", as: :anncs
  get "/anncs/add" => "announcements#new", as: :new_announcement
  delete "/anncs/delete" => "announcements#destroy", as: :delete_announcement
  resources :users, only:[:new, :index, :create]
  get "/users/name" => "users#show", as: :get_name
  get "/register" => redirect("/users/new")

  resources :sessions
  resources :events , :except => [:show] do
	  resources :teams, :controller => 'signup'
  end
  #resources :teamlists, only: [:destroy]
  #resources :signup
  #get "/login" => redirect("/sessions/new")
  get "/login" => redirect("/sessions/new")
  post "/login" => redirect("/sessions/create")

  delete "/members/cancel", to: "teamlists#destroy", as: :cancel_team_member

  
  get "/events/status" => "status#index", as: :events_status
  get "/events/:id" => "events#show"
end
