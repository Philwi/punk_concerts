Rails.application.routes.draw do
  localized do
    scope "/:locale" do
      resources :shows do
        collection do
          get 'search'
        end
      end
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      root to: 'shows#index'
    end
  end
end
