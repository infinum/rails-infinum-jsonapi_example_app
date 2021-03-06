Rails.application.routes.draw do
  devise_for :users, only: [:sessions]

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        scope module: :auth do
          resource :sessions, only: [:create, :destroy]
        end
      end

      resources :movies, only: [:index]

      namespace :restricted, path: '' do
        resources :movies, only: [:create]
      end
    end
  end
end
