Webmil::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

	root to: 'pages#home'

	match '/works',    to: 'pages#works'
	match '/team',   to: 'pages#team'
	match '/contacts', to: 'pages#contacts'
end
