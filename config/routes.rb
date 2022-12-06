Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get '/login' => 'users/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/users/confirm' => 'registrations#confirm'
    post '/users/invitations' => 'users/invitations#resend'
  end

  root to: 'home#index'
end
