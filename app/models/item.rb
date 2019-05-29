class Item < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy

  enum category: { Property: 0, Auto: 1, Technics: 2, Clothes: 3, Sports: 4, Animals: 5, Work: 6, Service: 7, Other: 8 }
  has_attached_file :image,
                    styles: { medium: "300x300>", index: "200x125>", thumb: "100x100>", small: "40x40" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
