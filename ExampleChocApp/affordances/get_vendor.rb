require_relative '../data/vendor.rb'

class GetVendor
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: VendorData.new(params).to_hash,
      affordances: [{:link_relation=>"products", :url=>"http://localhost:4567/products", :http_method=>"GET", :params=>nil}]
    }
  end
end
