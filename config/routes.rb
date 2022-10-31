Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "pages#home"

  get "generate", to: "pages#generate", as: :generate
  get "dashboard", to: "pages#index", as: :dashboard
  get "invitation", to: "pages#invitation", as: :invitation
  get "mygroups", to: "pages#mygroups", as: :mygroups
  patch "invitation", to: "pages#invitation"
  
  resources :passwords
  resources :bank_passwords

  resources :groups do
    resources :group_invitations, except: [:destroy]
    delete "group_invitations/:id", to: "group_invitations#destroy", as: :delete_invitation
  end

end
