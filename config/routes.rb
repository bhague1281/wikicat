Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'category/:category' => 'category#show', :as => :category
      get 'graph/:category' => 'graph#show', :as => :graph
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
