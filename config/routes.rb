Rails.application.routes.draw do
  resources :shortened_urls, :except => ['show']
  get    'shortened_urls/:unique_key' => 'shortened_urls#show'
end
