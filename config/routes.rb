Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope :api, defaults: { format: :json } do
    scope :v1, defaults: { format: :json } do
      mount_devise_token_auth_for 'User', at: 'auth'
      put 'likes/:id' => 'like#like'
      put 'dislikes/:id' => 'dislike#dislike'
    end
  end
end
