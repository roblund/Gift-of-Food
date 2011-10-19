Giftoffood::Application.routes.draw do

  root :to => 'home#index'

  resource :volunteers, :only => [:new,:create] do
  end

  namespace :admin do
    root :to => 'volunteers#index'
    resources :volunteers
  end

end
