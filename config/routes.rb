ListaCompras::Application.routes.draw do

  resources :lists do
    resources :products do
      put :done, :on => :collection
    end
  end

end