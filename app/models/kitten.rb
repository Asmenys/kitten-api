class Kitten < ApplicationRecord
    validates :name, presence: true
    validates :cuteness, presence: true
    validates :softness, presence: true
    validates :age, presence: true
end
