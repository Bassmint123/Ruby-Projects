Rails.application.routes.draw do
  
  resources :articles do
    resources :comments
  end
  # Start with the welcome page
  root 'welcome#index'  

end
