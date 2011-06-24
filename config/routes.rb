Makeabandtome::Application.routes.draw do
  
  root :to => "bands#new"
  resources :bands

end
