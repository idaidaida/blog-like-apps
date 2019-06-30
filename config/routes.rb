Rails.application.routes.draw do
  root to: "blogs#index"
  resources :blogs do
    resources :entries, only:[:show,:new,:edit,:create,:update] do
      resources :comments, only:[:create,:destroy] do
        patch :approve, on: :member
      end
    end
  end
end
