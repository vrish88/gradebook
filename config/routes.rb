Rails.application.routes.draw do
  resources :students do
    resources :grades

    resources :years do
      resources :grades
    end
  end
  root 'students#index'
end
