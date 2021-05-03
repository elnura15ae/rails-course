# forzen_string_literal: true

Rails.application.routes.draw do
  resources :items do
    get :upvote, on: :member
  end
end

