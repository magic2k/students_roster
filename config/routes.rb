Rails.application.routes.draw do
  root 'students#index'

  resources :students
  resources :grade
end
