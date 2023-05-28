Rails.application.routes.draw do


  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }

  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }
  # ゲストログイン用
  devise_scope :customer do
   post 'customers/guest_sign_in'=>'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to:'homes#top'
    get 'about'=>'homes#about',as:'about'
    resources:customers,only:[:index,:show,:edit,:update] do
      collection do
        get 'confilm'
        patch 'withdrawal'
      end
    end
    resources:post_shogi_places do
      collection do

      end
      resources:postcomments,only:[:create,:destroy]
      resource:favorites,only:[:create,:destroy]
    end
    get 'search_tag'=>'post_shogi_places#search_tag'
    get 'search_keyword'=>'post_shogi_places#search_keyword'
    get 'multi_criteria_search'=>'post_shogi_places#multi_criteria_search'
  end

  get 'admin'=>'admin/homes#top',as:'admin'

  namespace :admin do
    resources:customers,only:[:index,:show,:edit,:update]
    resources:post_shogi_places,only:[:show,:destroy] do
      resources:postcomments,only:[:destroy]
    end
    get 'search_tag'=>'post_shogi_places#search_tag'
    get 'search_keyword'=>'post_shogi_places#search_keyword'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
