Rails.application.routes.draw do

  get 'groups/index'

  get 'groups/new'

  get 'groups/create'

  root 'students#index'

  resources :students
end
