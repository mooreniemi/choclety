require_relative '../data/products.rb'

class GetProducts
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: ProductsData.new(params).to_hash,
      affordances: [{:link_relation=>"product_id", :url=>"http://localhost:4567/products/:product_id", :http_method=>"GET", :params=>nil}, {:link_relation=>"by_rating", :url=>"http://localhost:4567/products?by_rating", :http_method=>"GET", :params=>{"?by_rating"=>"rating"}}]
    }
  end
end
