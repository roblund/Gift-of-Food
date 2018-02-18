Rails.application.routes.draw do

  root :to => 'home#index'

  resource :volunteers, :only => [:new,:create] do
  end

  get "/volunteers/maps" => "volunteers#maps"


  namespace :admin do
    root :to => 'volunteers#index'
    get "/volunteers/maps" => "volunteers#maps"
    get "/volunteers/empty_maps" => "volunteers#empty_maps"
    resources :volunteers
    resources :neighborhoods
  end

end
