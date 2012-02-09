class Product < ActiveRecord::Base
   has_many :demands, :dependent => :destroy
   has_many :follower_products, :dependent => :destroy
end
