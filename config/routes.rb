Rails.application.routes.draw do
  root 'exchanges#index'
  post 'convert', to: 'exchanges#convert'
end
