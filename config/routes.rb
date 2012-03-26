Webmil::Application.routes.draw do
  get "work/index"

  get "work/show"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

	root to: 'pages#home'

	match '/works',    to: 'pages#works'
	match '/team',   to: 'pages#team'
	match '/contacts', to: 'pages#contacts'

	match 'contact' => 'contact#new', :as => 'contact', :via => :get
	match 'contact' => 'contact#create', :as => 'contact', :via => :post	
end
