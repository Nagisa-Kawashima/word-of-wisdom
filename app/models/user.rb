class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  # def get_profile_image(width, height)
  # unless profile_image.attached?
  #   file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #   profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  # end
  # profile_image.variant(resize_to_limit: [width, height]).processed
  # end


  has_one_attached :profile_image
  # def get_profile_image
  #   unless profile_image.attached?
  #     file_path = Rails.root.join("app/assets/images/no_image.jpg")
  #     profile_image.attach(io: File.open(file_path), filename: "no_image.jpg", content_type: "image/jpeg")
  #   end
  #   profile_image
  # end


  validates :name, presence: true, length: { maximum: 20 }, uniqueness: { scope: :user }
  validates :email, { presence: true,  uniqueness: true}
  validates :password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
  #パスワードに半角英数字を両方含める
  validates :is_deleted, inclusion: { in: [true, false] }


  #   国名表示の設定
  def counrty
    Carmen::Country.coded(country_code)
  end


end
