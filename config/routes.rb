WordsCounter::Application.routes.draw do
  resources :widgets
  post 'counter' => 'counter#create'
  post 'counter_from_file' => 'counter#create_from_file'
  get 'statistics' => 'statistics#show'
end
