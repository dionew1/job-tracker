Rails.application.routes.draw do
  root to: "homes#show"
  resources :categories
  resources :companies do
    resources :jobs
  end
  resources :jobs, only: [:show] do
    resources :comments, only: [:create]
  end
end
