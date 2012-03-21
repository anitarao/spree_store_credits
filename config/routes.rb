Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :store_credits
    resources :users do
      resources :store_credits
    end
  end
  match "/store_credit_howto" => 'users#store_credit_howto', :as => :store_credit_howto
end
