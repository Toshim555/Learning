Rails.application.routes.draw do
  root 'dulls#index'
  resources :dulls do 
    post :filtered, on: :member 
  end
end
