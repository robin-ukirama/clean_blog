class User < ApplicationRecord
    has_many :blog_posts, dependent: :destroy

    before_save   :downcase_email
    validates :name,  presence: true, length: { maximum: 45}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 45 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true

    private

    # Converts email to all lowercase.
    def downcase_email
        self.email = email.downcase
    end
end
