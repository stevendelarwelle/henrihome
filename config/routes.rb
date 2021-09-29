Rails.application.routes.draw do
  get 'services/get_quote'
  get 'services/rate_quote'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

end
