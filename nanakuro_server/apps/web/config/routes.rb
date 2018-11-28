# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

resources :questions, only: [:index, :create, :update, :destroy]
resources :question_groups, only: [:index, :show]
resources :users, only: :create

post '/sign_in', to: 'sessions#create'
delete '/sign_out', to: 'sessions#destroy'

