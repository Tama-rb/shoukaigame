Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'questions#index'

  post 'question', to: 'questions#question'
  post 'conjunction', to: 'questions#conjunction'
  post 'theme', to: 'questions#theme'
end
