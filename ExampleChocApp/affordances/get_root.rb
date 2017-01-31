require_relative '../data/root.rb'

class GetRoot
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: RootData.new(params).to_hash,
      affordances: [{:link_relation=>"shoppe", :url=>"http://localhost:4567/homepage", :http_method=>"GET", :params=>nil}]
    }
  end
end
