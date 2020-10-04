Rails.application.routes.draw do
  root to: 'shows#index'

  localized do
    scope "/:locale" do
      devise_for :admin_users, ActiveAdmin::Devise.config
      ActiveAdmin.routes(self)
      resources :shows do
        collection do
          get 'search'
        end
      end
      resources :comments
      resources :contacts
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      root to: 'shows#index'
    end
  end
end
