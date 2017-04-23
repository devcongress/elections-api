Rails.application.routes.draw do
  namespace :v1 do
    resources :elections
    resources :political_parties
  end
end
