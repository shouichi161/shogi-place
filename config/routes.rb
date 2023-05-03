Rails.application.routes.draw do


  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }

  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  scope module: :public do
    root to:'homes#top'
    get 'about'=>'homes#about',as:'about'
    resources:customers,only:[:index,:show,:edit,:update] do
      collection do
        get 'confilm'
        patch 'withdrawal'
      end
    end
    resources:shogi_places do
      resources:postcomments,only:[:create,:destroy]
      resource:favorites,only:[:create,:destroy]
    end
  end

  get 'admin'=>'admin/homes#top',as:'admin'

  namespace :admin do
    resources:customers,only:[:index,:show,:edit,:update]
    resources:shogi_places,only:[:show,:destroy] do
      resources:postcomments,only:[:destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
