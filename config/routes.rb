Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'categories/create', to: 'categories#create'
  get 'categories/all', to: 'categories#show'
  post 'categories/update',to: 'categories#update'
  post 'categories/delete', to: 'categories#destroy'
end
