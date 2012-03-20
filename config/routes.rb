Webmil::Application.routes.draw do
	root to: 'pages#home'

	match '/works',    to: 'pages#works'
	match '/team',   to: 'pages#team'
	match '/contacts', to: 'pages#contacts'
end
