Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    resources :cocktails, only: [:index, :new, :create, :show] do
      member do                          # member => cockail id in URL
        resources :doses, only: [:new, :create, :show, :delete]        # CocktailsController#doses
      end
    end
  end
end
