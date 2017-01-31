require_relative '../data/categories.rb'

class GetCategories
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: CategoriesData.new(params).to_hash,
      affordances: [{:link_relation=>"category_id", :url=>"http://localhost:4567/categories/:category_id", :http_method=>"GET", :params=>nil}]
    }
  end
end
