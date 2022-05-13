Rails.application.routes.draw do
  root to: 'members#index'

  devise_for :members do

  end
  # resources :admins do
  #   member do
  #   patch :deactivate
  #   end
  # end

  resources :members do
    collection {post :import}



    member do
      get :deactivate
    end
  end


  resources :subjects do
    resources :comments, only: [:create, :destroy, :edit]
  end
  resources :likes, only: [:create, :destroy]


  # get 'members/sign_up', to: 'sessions/index'
  post "/", as:"create", to: "subjects#create"
  # get "/destroy", as:"logout", to: "sessions#destroy"
  get 'members/sign_up', to: 'registrations#new'
  post 'members/sign_up', to: 'registrations#create'
  get '/logout', to: 'sessions#destroy' ,as: :delete
  # delete '/members/sign_out', to: 'session#destroy', as: :logout
  post 'members/sign_up', to: 'registrations#create'
  get 'profiles', to: 'profiles#index'
  get 'home', to: 'pages#home'
  get '/members/home', to: 'pages#home'
  # get '/admins/createuser', to: 'admins#adduser'
  # get '/members/show/deactivate', to: 'members#show'
  get '/dashboard', to: 'members#index'
  get '/manageuser', to: 'members#show'
  get '/add/manageuser', to: 'members#show'
  get '/add/users', to: 'members#new'
  get '/members/new', to: 'members#new'
  post "/members/create_member", as:"create_member", to: "members#create"
  post "post/created", as:"post_create", to: "subjects#create"
  get '/subjects/manageuser', to: 'members#show'
  get '/subject/:id/comments/:id/edit', to: 'comments#edit'
  get '/subjects/manageuser', to: 'members#show'
  get '/reports', to: 'members#reports'
  # get '/members/:id/deactivate', to: 'members#deactivate'

  get 'import/file', to: 'members#uploading'
  get 'sorted_report', to: 'members#sorted'
  get 'postwise_report', to: 'subjects#sortreported'



end
