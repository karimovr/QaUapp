Rails.application.routes.draw do
  resources :question
  resources :questions do
    resources :answers

  end
  root to: 'questions#index'
end
