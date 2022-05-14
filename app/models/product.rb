class Product < ApplicationRecord
    has_one_attached :main_photo

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    # validates :main_photo, presence: true
end
