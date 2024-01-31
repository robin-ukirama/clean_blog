class BlogPost < ApplicationRecord
  belongs_to :user

  validates :title,  presence: true, length: { maximum: 50}
  validates :summary,  presence: true, length: { maximum: 150}
  validates :content,  presence: true
  validates :user_id, presence: true

end
