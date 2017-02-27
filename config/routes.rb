Rails.application.routes.draw do
	get '/main(.:format)' => 'sessions#new'
	post '/login(.:format)' => 'sessions#create'
	delete '/logout(.:format)' => 'sessions#destroy'

	post '/users/create' => 'users#create'

	get '/dashboard/:id(.:format)' => 'users#show'
	post '/shoes(.:format)' => 'shoes#create'
	delete '/shoes/:id(.:format)' => 'shoes#destroy'

	get '/shoes(.:format)' => 'shoes#index'
	put '/shoes/:id(.:format)' => 'shoes#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
