class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :title_is_clickbaity?

    clickbait = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def title_is_clickbaity?
        if clickbait.none? { |pat| pat.match title }
            errors.add(:title, "Must be clickbait.")
        end
    end
end
