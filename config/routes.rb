Rails.application.routes.draw do
  root :to => "contributions#index"

  resources :contributions do
    resources :opinions, :except => [:index, :show]
  end

end
