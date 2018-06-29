Rails.application.routes.draw do
  root :to => "announcements#index"
  resources :announcements do
    collection do
      delete "bulk_destroy"
    end
  end

  resources :users, only:[:new, :index, :create] do
    collection do
      get 'search'
    end
  end

  get "/events/status" => "status#index", as: :events_status
  resources :events do
	  resources :teams, :controller => 'signup'
  end

  resources :sessions, only: [:new, :create, :destroy]
  delete "/members/cancel", to: "teamlists#destroy", as: :cancel_team_member
end
