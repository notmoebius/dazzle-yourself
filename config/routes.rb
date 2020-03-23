Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users


  root to: 'static#home'
  get 'homepage', to:'static#homepage'

  resources :users do
    resources :skill_setups
  end

  resources :projects do
    resources :charges, path: 'paiement'
    resources :attendances, path: 'inscription'
  end

    namespace :admin do
    root 'admin#index'
    resources :users, :projects, :project_submissions
  end

end
