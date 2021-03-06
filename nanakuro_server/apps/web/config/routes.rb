# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

resources :questions, only: [:index, :create, :update, :destroy]
resources :question_groups, only: [:index, :show] do
  resources :question_rooms, only: :create
end
resources :users, only: :create

resources :answer_groups, only: :create do
  resources :answers, only: [:create, :update]
end

post '/sign_in', to: 'sessions#create'
delete '/sign_out', to: 'sessions#destroy'

