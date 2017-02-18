Rails.application.routes.draw do
  defaults format: 'json' do
    resources :properties
  end
end
