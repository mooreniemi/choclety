require_relative '../data/review.rb'

class PutReview
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: ReviewData.new(params).to_hash,
      affordances: [{:link_relation=>"edit", :url=>"http://localhost:4567/review", :http_method=>"PUT", :params=>nil}]
    }
  end
end
