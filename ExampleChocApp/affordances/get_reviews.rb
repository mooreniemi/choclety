require_relative '../data/reviews.rb'

class GetReviews
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: ReviewsData.new(params).to_hash,
      affordances: [{:link_relation=>"review_id", :url=>"http://localhost:4567/reviews/:review_id", :http_method=>"GET", :params=>nil}, {:link_relation=>"add", :url=>"http://localhost:4567/review", :http_method=>"POST", :params=>nil}]
    }
  end
end
