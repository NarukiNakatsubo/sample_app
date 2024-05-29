Rails.application.routes.draw do
  get 'lists/new'
  get 'top' => 'homes#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  # .../lists/1や.../lists/3に該当
  # どの投稿データを表示するか判別するために
  # 投稿データのidも含める  
  # asオプションでルーティングに名前を付ける
  get 'lists/:id' => 'lists#show', as: 'list'

  get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
