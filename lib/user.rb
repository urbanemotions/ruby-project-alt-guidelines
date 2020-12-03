class User < ActiveRecord::Base
    has_many :reviews 
    has_many :items, through: :reviews
end