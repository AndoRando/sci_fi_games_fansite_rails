Rails.application.routes.draw do
  root :to => "contributions#index"

  resources :contributions do
    resources :opinions
  end

end
