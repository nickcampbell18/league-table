LeagueTable::Application.routes.draw do
  resources :clubs do
    resources :teams
  end
  
  root :to => 'clubs#index'

end
