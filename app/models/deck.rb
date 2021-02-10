require 'pry'

class Deck < ActiveRecord::Base
    belongs_to :user
    has_many :cards

    validates :name, presence: true
    validates :name, length: {minimum: 1}



    def slug #could be combined with the user.rb slug methods

        self.name.strip.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)#could be combined with the user.rb slug methods
        Deck.all.find {|deck| deck.slug == slug}
    end
end