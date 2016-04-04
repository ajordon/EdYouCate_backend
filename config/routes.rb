Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

  resources :classrooms, except: [:new, :edit]
  resources :assignments, except: [:new, :edit]
  resources :students, except: [:new, :edit]
end
