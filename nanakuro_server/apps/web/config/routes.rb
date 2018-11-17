# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

resources :questions, only: [:index, :create, :update, :destroy]
resources :question_groups, only: :index
resources :users, only: :create
post '/sessions', to: 'sessions#create'
