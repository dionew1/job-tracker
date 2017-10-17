Rails.application.routes.draw do
  root to: "homes#show"
  resources :categories
  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end
  resources :jobs, only: [:show] do
    resources :comments, only: [:create]
  end
end
