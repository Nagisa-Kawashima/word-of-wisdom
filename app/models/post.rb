class Post < ApplicationRecord
  belongs_to :user


  validates :sentence, presence: true, length: { minimum: 1, maximum: 1000}
  validates :image, content_type: { in: %w[ image/jpg image/jpeg image/gif image/png]}, size: { less_than: 5.megabytes }


  STATUS_VALUES = ['published', 'unpublished']


  validates :post_status, inclusion: { in: STATUS_VALUES }
  # validates :post_status, inclusion: { in: Post.post_statuses.keys }




  has_one_attached :image



  # published: 公開, unpublished: 非公開
  enum post_status: { published: 0, unpublished: 1 }



end
