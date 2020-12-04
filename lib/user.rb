class User < ActiveRecord::Base
    has_many :reviews 
    has_many :subscriptions, through: :reviews
end