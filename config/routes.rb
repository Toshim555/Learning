Rails.application.routes.draw do
  root 'dulls#index'
  resources :dulls do 
    patch :filtered, on: :member
  end
end
