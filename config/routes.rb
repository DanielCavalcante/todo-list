Rails.application.routes.draw do

    #get '/' => 'site#home'
    root to: 'site#home'

    get '/signup' => 'signup#new', as: 'signup'
    post '/signup' => 'signup#create'

    get '/login' => 'login#new', as: 'login'
    post 'login' => 'login#create'

    get '/tasks' => 'tasks#index', as: 'tasks'
end
