class Photo < ApplicationRecord
    validates :embended_html, presence: true, length: { maximum: 255 }
    validates :caption, presence: true, length: { maximum: 255 }
end

