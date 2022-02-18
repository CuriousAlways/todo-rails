Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :tasks do
    get 'favourite', action: 'favourite_tasks', on: :collection
    get 'completed', action: 'completed_tasks', on: :collection
  end

  controller 'sessions' do 
    get 'login', action: 'new'
    post 'login', action: 'create'
    delete 'logout', action: 'destroy'
  end

  root to:'tasks#index'
end
