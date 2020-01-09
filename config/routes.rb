Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope :api, defaults: { format: :json } do
    scope :v1, defaults: { format: :json } do
      mount_devise_token_auth_for 'User', at: 'auth'
      get 'likes/:id' => 'like#like'
      get 'dislikes/:id' => 'dislike#dislike'
    end
  end
end
