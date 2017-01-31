require_relative '../data/homepage.rb'

class GetHomepage
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: HomepageData.new(params).to_hash,
      affordances: [{:link_relation=>"top_5_product_id", :url=>"http://localhost:4567/products/:product_id", :http_method=>"GET", :params=>{":product_id"=>"top_5_product_id"}}, {:link_relation=>"by_category", :url=>"http://localhost:4567/categories", :http_method=>"GET", :params=>nil}, {:link_relation=>"by_vendor", :url=>"http://localhost:4567/vendors", :http_method=>"GET", :params=>nil}]
    }
  end
end
