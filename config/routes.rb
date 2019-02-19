Rails.application.routes.draw do
  root 'homes#index'

  resources :conjunctions do
    post :result, on: :collection  
  end

  resources :questions do
    post :result, on: :collection
  end

  resources :themes do
    post :result, on: :collection
  end
end
