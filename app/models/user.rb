class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favourite_product
        self.reviews.order(:star_rating).last
    end

    def remove_reviews(product)
        self.reviews.where(product: product)destroy.all
