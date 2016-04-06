Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'category' => 'category#show', :as => :category
      get 'category/:category' => 'category#show', :as => :category_show
      get 'graph' => 'graph#show', :as => :graph
      get 'graph/:category' => 'graph#show', :as => :graph_show
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
