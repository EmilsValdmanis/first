Rails.application.routes.draw do
  root "main#index"

  # get "quizzes", to: "quizzes#index"
  # get "quizzes/new", to: "quizzes#new"
  # post "quizzes", to: "quizzes#create"
  # get "quizzes/:id", to: "quizzes#show"
  # delete "quizzes/:id", to: "quizzes#delete" 

  resources :quizzes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
