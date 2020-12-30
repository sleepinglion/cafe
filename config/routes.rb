Rails.application.routes.draw do
  root 'orders#new'

  resources :accounts
  resources :accounts_products
  resources :accounts_product_categories
  resources :product_categories
  resources :products
  resources :orders
  resources :users
  resources :points
  resources :operators
  resources :branches

  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end

  #devise_for :users, :controllers => {:omniauth_callbacks=>'users/omniauth_callbacks', :sessions => "users/sessions",:registrations => "users/registrations",:passwords => "users/passwords"}, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
  #  get '/users', :to => 'users/registrations#index', :as => :user_root # Rails 3s
  #  get '/login', :to => 'users/sessions#new'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
