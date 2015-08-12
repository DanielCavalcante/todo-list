Rails.application.routes.draw do
    get '/' => 'site#home'

    get '/signup' => 'signup#new'
    post '/signup' => 'signup#create'

    get '/login' => 'login#new'
end
