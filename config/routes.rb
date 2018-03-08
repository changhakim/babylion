Rails.application.routes.draw do
  devise_for :users

  # 수정
  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/create' => 'posts#create'

  get 'posts/show/:id' => 'posts#show', as: 'post' # as 추가

  get 'posts/edit/:id' => 'posts#edit'

  post 'posts/update/:id' => 'posts#update'

  delete 'posts/destroy/:id' => 'posts#destroy'

  post 'posts/like/:id' => 'posts#like', as: 'post_like' # 좋아요
  post 'posts/dislike/:id' => 'posts#dislike', as: 'post_dislike' # 싫어요


  post 'comments/create' => 'comments#create'

  post 'comments/destroy/:id' => 'comments#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
