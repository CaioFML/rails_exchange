Rails.application.routes.draw do
  get 'exchanges/index'
  get 'exchanges/convert'

  root "exchanges#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
