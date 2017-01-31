require_relative '../data/product.rb'

class GetProduct
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: ProductData.new(params).to_hash,
      affordances: [{:link_relation=>"reviews", :url=>"http://localhost:4567/products/:product_id/reviews", :http_method=>"GET", :params=>nil}, {:link_relation=>"add", :url=>"http://localhost:4567/cart", :http_method=>"POST", :params=>{"product_id"=>"product_id"}}, {:link_relation=>"vendor_id", :url=>"http://localhost:4567/product/:vendor_id", :http_method=>"GET", :params=>nil}]
    }
  end
end
