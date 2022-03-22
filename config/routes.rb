Rails.application.routes.draw do
  namespace :public do
    get 'homes/items'
    get 'homes/customers'
    get 'homes/cart_items'
    get 'homes/orders'
    get 'homes/addresses'
  end
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
}
# devise_for :customers, controllers: {
#   sessions:      'customers/sessions',
#   passwords:     'customers/passwords',
#   registrations: 'customers/registrations'
# }
scope module: :public do
  get "/customers/sign_up" => "registrations#new", as: :new_customer_registration
  post "/customers" => "registrations#create", as: :customer_registration
  get "/customers/sign_in" => "sessions#new", as: :new_customer_session
  post "/customers/sign_in" => "sessions#create", as: :customer_session
  delete "/customers/sign_out" => "sessions#destroy", as: :destroy_customer_session
  resources :homes, only:[:top, :about]
  resources :items, only:[:index, :show]
  resources :customers, only:[:show, :edit, :update]
  get "/customers/exit" => "customers#exit"
  patch "/customers/withdraw" => "customers#withdraw"
  resources :cart_items, only:[:index, :update, :create]
  patch "/cart_items/:id" => "cart_items#destroy"
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admin do
  resources :items
  resources :customers, only:[:index, :show, :edit, :update]
end

end
