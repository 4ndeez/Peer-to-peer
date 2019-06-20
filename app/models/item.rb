class Item < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :pictures, dependent: :destroy

  validates :price, :title, presence: true

  enum category: { Property: 0, Auto: 1, Technics: 2, Clothes: 3, Sports: 4, Animals: 5, Work: 6, Service: 7, Other: 8 }
  has_attached_file :image,
                    styles: { medium: "300x300>", index: "200x125>", thumb: "100x100>", small: "40x40" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(params)
    params.delete_if { |_key, value| value.empty? }
    if params[:price_from].present? && params[:price_to].present?
      params[:price] = params[:price_from]..params[:price_to]
      params.delete(:price_from)
      params.delete(:price_to)
    elsif params[:price_from].present? && params[:price_to].blank?
      params[:price] = params[:price_from].to_i..9999999999999
      params.delete(:price_from)
      params.delete(:price_to)
    elsif params[:price_from].blank? && params[:price_to].blank?
    else
      params[:price] = 0..params[:price_to].to_i
      params.delete(:price_from)
      params.delete(:price_to)
    end

    if params[:image_file_size].present?
      params[:image_file_size] = 1..99999999
      where(params)
    else
      where(params)
    end
  end
end
