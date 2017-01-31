require_relative '../data/vendors.rb'

class GetVendors
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: VendorsData.new(params).to_hash,
      affordances: [{:link_relation=>"vendor_id", :url=>"http://localhost:4567/vendors/:vendor_id", :http_method=>"GET", :params=>nil}]
    }
  end
end
