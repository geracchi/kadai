class Event < ApplicationRecord
    belongs_to :user
    
    def self.search(search)
        if search
            Event.where(['title LIKE ?', "%#{search}%"])
        else
            Event.all
        end
    end
end
