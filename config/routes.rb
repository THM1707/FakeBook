Rails.application.routes.draw do

  get '', to: 'home#index'

  post 'auth/login', to: 'authentication#authenticate'

  post 'signup', to: 'users#create'

  get 'pages', to: 'pages#index'

  post 'pages', to: 'page#create'

  put 'pages/:id', to: 'pages#update'

  delete 'pages/:id', to: 'pages#destroy'

  get 'categories', to: 'categories#index'

  post 'categories', to: 'categories#create'

  put 'categories/:id', to: 'categories#update'

  delete 'categories/:id', to: 'categories#destroy'

  post 'user/savePost', to: 'users#save'

  post 'user/deletePost', to: 'users#unsave'

  get 'user/getPosts', to: 'users#show_saved_posts'

  get 'posts', to: 'posts#index'

  get 'user/getPostsURL', to: 'users#show_saved_posts_url'

end
