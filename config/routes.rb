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

  namespace :api do
    namespace :v1 do
      resources :questions, only: [:create] do
        get :random, on: :collection
      end
    end
  end
end
