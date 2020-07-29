class Photo < ApplicationRecord
    belongs_to :user
    validates :embended_html, presence: true, length: { maximum: 255 }
    validates :caption, presence: true, length: { maximum: 50 }
    
     has_many :comments, dependent: :destroy
end

