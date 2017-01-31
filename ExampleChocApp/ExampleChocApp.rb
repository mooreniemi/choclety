require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'affordances/get_homepage'
require_relative 'affordances/get_product'
require_relative 'affordances/get_categories'
require_relative 'affordances/get_vendors'
require_relative 'affordances/get_products'
require_relative 'affordances/get_product'
require_relative 'affordances/get_products'
require_relative 'affordances/get_reviews'
require_relative 'affordances/get_review'
require_relative 'affordances/post_review'
require_relative 'affordances/put_review'
require_relative 'affordances/post_cart'
require_relative 'affordances/delete_cart'
require_relative 'affordances/post_invoice'
require_relative 'affordances/get_vendor'
require_relative 'affordances/get_vendor'
require_relative 'affordances/get_products'
require_relative 'affordances/get_root'


get '/homepage' do
  json(GetHomepage.new(params).response)
end

get '/products/:product_id' do
  json(GetProduct.new(params).response)
end

get '/categories' do
  json(GetCategories.new(params).response)
end

get '/vendors' do
  json(GetVendors.new(params).response)
end

get '/categories/:category_id' do
  json(GetProducts.new(params).response)
end

get '/products/:product_id' do
  json(GetProduct.new(params).response)
end

get '/products' do
  json(GetProducts.new(params).response)
end

get '/products/:product_id/reviews' do
  json(GetReviews.new(params).response)
end

get '/reviews/:review_id' do
  json(GetReview.new(params).response)
end

post '/review' do
  json(PostReview.new(params).response)
end

put '/review' do
  json(PutReview.new(params).response)
end

post '/cart' do
  json(PostCart.new(params).response)
end

delete '/cart/:cart_id/:product_id' do
  json(DeleteCart.new(params).response)
end

post '/invoice' do
  json(PostInvoice.new(params).response)
end

get '/product/:vendor_id' do
  json(GetVendor.new(params).response)
end

get '/vendors/:vendor_id' do
  json(GetVendor.new(params).response)
end

get '/products' do
  json(GetProducts.new(params).response)
end

get '/' do
  json(GetRoot.new(params).response)
end

