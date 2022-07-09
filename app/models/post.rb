class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_contains_clickbait

  def title_contains_clickbait
    if !(/Won't Believe/.match?(title) || /Top \d/.match?(title) || /Guess/.match?(title))
      errors.add(:title, "must contain \"won\"t believe\", \"top 10\", or \"guess\"")
    end
  end
end
