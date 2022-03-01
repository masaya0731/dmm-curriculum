class AgainBook < ApplicationRecord
  belongs_to :user
  has_many :again_favorites, dependent: :destroy

  def again_favorited_by?(user)
    again_favorites.where(user_id: user.id).exists
  end

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
