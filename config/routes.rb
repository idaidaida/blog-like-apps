Rails.application.routes.draw do
  root to: "blogs#index"
  resources :blogs do
    resources :entries do
      resources :comments do
        patch :approve, on: :member
      end
    end
  end
end
