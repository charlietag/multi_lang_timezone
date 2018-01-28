Rails.application.routes.draw do
  # Comment scope, instead using router-filter
  filter :pagination,:locale
  #scope "/:locale" , locale: /en|zh-TW/ do
    resources :articles
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: "articles#index"
  #end
end
