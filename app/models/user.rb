class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy




  has_one_attached :profile_image
  # def get_profile_image
  #   unless profile_image.attached?
  #     file_path = Rails.root.join("app/assets/images/no_image.jpg")
  #     profile_image.attach(io: File.open(file_path), filename: "no_image.jpg", content_type: "image/jpeg")
  #   end
  #   profile_image
  # end



  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, { presence: true,  uniqueness: true}
  validates :profile_image, content_type: { in: %w[ image/jpg image/jpeg image/gif image/png]}, size: { less_than: 5.megabytes }

  # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ }
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX }


#半角英数字混合で6文字以上 ※大文字小文字の区別なし

  #パスワードに半角英数字を両方含める
  validates :is_deleted, inclusion: { in: [true, false] }


  #   国名表示の設定
  def counrty
    Carmen::Country.coded(country_code)
  end


end
