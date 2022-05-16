class Product < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        title: 'A',
        description: 'B'
      }
    has_one_attached :main_photo

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    # validates :main_photo, presence: true

    belongs_to :category
end
