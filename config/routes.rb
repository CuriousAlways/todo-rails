Rails.application.routes.draw do
  resources :tasks do
    get 'favourite', action: 'favourite_tasks', on: :collection
    get 'completed', action: 'completed_tasks', on: :collection
  end

  root to:'tasks#index'
end
