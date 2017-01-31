require_relative '../data/cart.rb'

class DeleteCart
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: CartData.new(params).to_hash,
      affordances: [{:link_relation=>"remove", :url=>"http://localhost:4567/cart/:cart_id/:product_id", :http_method=>"DELETE", :params=>nil}, {:link_relation=>"buy", :url=>"http://localhost:4567/invoice", :http_method=>"POST", :params=>{"cart_id"=>"cart_id"}}]
    }
  end
end
