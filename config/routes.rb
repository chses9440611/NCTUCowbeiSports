Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :announcements, only: [:index,:new, :create, :show, :edit, :delete] do
	  member do 
		  get :modal
	  end
  end

end
