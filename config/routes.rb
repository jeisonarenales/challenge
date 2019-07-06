Rails.application.routes.draw do
  get 'top' => 'shortened_urls#top'
  get 'shortened_urls/:unique_key' => 'shortened_urls#show', as: 'shortened_url'
  post 'url' => 'shortened_urls#create'
  get '/:unique_key' => 'shortened_urls#real_url'
end
