require_relative '../data/invoice.rb'

class PostInvoice
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  def response
    {
      data: InvoiceData.new(params).to_hash,
      affordances: []
    }
  end
end
