Giftoffood::Application.routes.draw do

  root :to => 'home#index'

  resource :volunteers, :only => [:new,:create] do
  end

  match "/volunteers/maps" => "volunteers#maps"

  namespace :admin do
    root :to => 'volunteers#index'
    resources :volunteers
  end

end
