Pixie::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admins, :skip => [:registrations, :passwords] 
  as :admin do
    get '' => 'photos#index', :as => :new_admin_registration
    get '' =>'photos#index', :as => :new_admin_password
  end
  root 'photos#index'
  resources :users, only: [:index, :show, :destroy]
  resources :photos, except: [:edit, :update] do
    member do
      get 'mark_accepted'
      get 'mark_not_accepted'
    end
    collection do
      get 'waiting'
    end
  end
end
