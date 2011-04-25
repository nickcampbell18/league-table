LeagueTable::Application.routes.draw do
  resources :clubs do
    resources :teams
  end

end
