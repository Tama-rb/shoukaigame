Rails.application.routes.draw do
  resources :votes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'homes#index'

  #post 'question', to: 'questions#result'
  #post 'conjunction', to: 'questions#result'
  #post 'theme', to: 'questions#theme'

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
