class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { user: 0, moderator: 1, admin: 2 }
  enum gender: { Male: true, Female: false }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  has_attached_file :avatar,
                    styles: { medium: "300x300>", profile: "200x200>", thumb: "100x100>", small: "40x40" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :items
end
