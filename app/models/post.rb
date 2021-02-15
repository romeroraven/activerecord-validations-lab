class Post < ActiveRecord::Base
    validates :title, length: { minimum: 2 }
    validates :content, length: { minimum: 200 }
    validates :summary, length: { maximum: 100 }
    validates :category, inclusion: { in:["Fiction", "Non-fiction"] }
    validate :clickbait

    def clickbait
        if self.title
            if self.title[/Won't Believe|Secret|Top|Guess/] == nil
            errors.add(:clickbait, "post not clickbait")
            end
        end
    end
end

 