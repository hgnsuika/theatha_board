Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos, except: [:index]
# 下記省略
#   get 'photos/:id', to: 'photos#show'
#   post 'photos', to: 'photos#create'
#   put 'photos/:id', to: 'photos#update'
#   delete 'photos/:id', to: 'photos#destroy'
  
#     # index: show の補助ページ
#   get 'photos', to: 'photos#index'
  
#     # new: 新規作成用のフォームページ
#   get 'photos/new', to: 'photos#new'
  
#     # edit: 更新用のフォームページ
#   get 'photos/:id/edit', to: 'photos#edit
  
 end
