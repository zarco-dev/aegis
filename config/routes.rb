Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "pages", to: "pages#generate", as: :generate
  get "pages", to: "pages#index", as: :dashboard

  resources :passwords
  resources :bank_passwords
  
  resources :groups do
    resources :group_invitations
  end

end
