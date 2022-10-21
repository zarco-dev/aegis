Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "pages#home"

  get "generate", to: "pages#generate", as: :generate
  get "dashboard", to: "pages#index", as: :dashboard

  resources :passwords
  resources :bank_passwords

  resources :groups do
    resources :group_invitations
  end

end
