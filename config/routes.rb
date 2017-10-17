Rails.application.routes.draw do
  root to: "homes#show"
  resources :categories
  resources :companies do
    resources :jobs
    # resources :contacts 
  end
  resources :jobs, only: [:show] do
    resources :comments, only: [:create]
  end
end
