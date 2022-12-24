class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # validates :main_photo, presence: true
  include Favoritable
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }
  has_one_attached :main_photo

  ORDER_BY = {
    newest: 'created_at DESC',
    expensive: 'price DESC',
    cheapest: 'price ASC'
  }

  belongs_to :category
  belongs_to :user, default: -> { Current.user }

  def owner?
    user_id == Current.user&.id
  end
  def broadcast
    broadcast_replace_to self, partial: 'products/product_details', locals: { product: self } 
  end
end
