require 'sinatra'
require 'json'
require 'sinatra/json'


get '/homepage' do
  json({
    data: {"welcome"=>"welcome to the shoppe!", "top_5_product_id"=>[1, 2, 3, 4, 5]},
    affordances: [{:link_relation=>"top_5_product_id", :url=>"http://localhost:4567/products/:product_id", :http_method=>"GET", :params=>{":product_id"=>"top_5_product_id"}}, {:link_relation=>"by_category", :url=>"http://localhost:4567/categories", :http_method=>"GET", :params=>nil}, {:link_relation=>"by_vendor", :url=>"http://localhost:4567/vendors", :http_method=>"GET", :params=>nil}]
  })
end

get '/products/:product_id' do
  json({
    data: {"product_id"=>"7a418918-03c4-481d-a30c-1a803d0d486e", "vendor_id"=>"b896f9dc-b693-4fe4-b908-dab9b285aa47"},
    affordances: [{:link_relation=>"reviews", :url=>"http://localhost:4567/products/:product_id/reviews", :http_method=>"GET", :params=>nil}, {:link_relation=>"add", :url=>"http://localhost:4567/cart", :http_method=>"POST", :params=>{"product_id"=>"product_id"}}, {:link_relation=>"vendor_id", :url=>"http://localhost:4567/product/:vendor_id", :http_method=>"GET", :params=>nil}]
  })
end

get '/categories' do
  json({
    data: {"category_id"=>[1, 2, 3]},
    affordances: [{:link_relation=>"category_id", :url=>"http://localhost:4567/categories/:category_id", :http_method=>"GET", :params=>nil}]
  })
end

get '/vendors' do
  json({
    data: {},
    affordances: [{:link_relation=>"vendor_id", :url=>"http://localhost:4567/vendors/:vendor_id", :http_method=>"GET", :params=>nil}]
  })
end

get '/categories/:category_id' do
  json({
    data: {"rating"=>[1, 2, 3]},
    affordances: [{:link_relation=>"product_id", :url=>"http://localhost:4567/products/:product_id", :http_method=>"GET", :params=>nil}, {:link_relation=>"by_rating", :url=>"http://localhost:4567/products?by_rating", :http_method=>"GET", :params=>{"?by_rating"=>"rating"}}]
  })
end

get '/products/:product_id' do
  json({
    data: {"product_id"=>"7a418918-03c4-481d-a30c-1a803d0d486e", "vendor_id"=>"b896f9dc-b693-4fe4-b908-dab9b285aa47"},
    affordances: [{:link_relation=>"reviews", :url=>"http://localhost:4567/products/:product_id/reviews", :http_method=>"GET", :params=>nil}, {:link_relation=>"add", :url=>"http://localhost:4567/cart", :http_method=>"POST", :params=>{"product_id"=>"product_id"}}, {:link_relation=>"vendor_id", :url=>"http://localhost:4567/product/:vendor_id", :http_method=>"GET", :params=>nil}]
  })
end

get '/products' do
  json({
    data: {"rating"=>[1, 2, 3]},
    affordances: [{:link_relation=>"product_id", :url=>"http://localhost:4567/products/:product_id", :http_method=>"GET", :params=>nil}, {:link_relation=>"by_rating", :url=>"http://localhost:4567/products?by_rating", :http_method=>"GET", :params=>{"?by_rating"=>"rating"}}]
  })
end

get '/products/:product_id/reviews' do
  json({
    data: {},
    affordances: [{:link_relation=>"review_id", :url=>"http://localhost:4567/reviews/:review_id", :http_method=>"GET", :params=>nil}, {:link_relation=>"add", :url=>"http://localhost:4567/review", :http_method=>"POST", :params=>nil}]
  })
end

get '/reviews/:review_id' do
  json({
    data: {},
    affordances: [{:link_relation=>"edit", :url=>"http://localhost:4567/review", :http_method=>"PUT", :params=>nil}]
  })
end

post '/review' do
  json({
    data: {},
    affordances: [{:link_relation=>"edit", :url=>"http://localhost:4567/review", :http_method=>"PUT", :params=>nil}]
  })
end

put '/review' do
  json({
    data: {},
    affordances: [{:link_relation=>"edit", :url=>"http://localhost:4567/review", :http_method=>"PUT", :params=>nil}]
  })
end

post '/cart' do
  json({
    data: {},
    affordances: [{:link_relation=>"remove", :url=>"http://localhost:4567/cart/:cart_id/:product_id", :http_method=>"DELETE", :params=>nil}, {:link_relation=>"buy", :url=>"http://localhost:4567/invoice", :http_method=>"POST", :params=>{"cart_id"=>"cart_id"}}]
  })
end

delete '/cart/:cart_id/:product_id' do
  json({
    data: {},
    affordances: [{:link_relation=>"remove", :url=>"http://localhost:4567/cart/:cart_id/:product_id", :http_method=>"DELETE", :params=>nil}, {:link_relation=>"buy", :url=>"http://localhost:4567/invoice", :http_method=>"POST", :params=>{"cart_id"=>"cart_id"}}]
  })
end

post '/invoice' do
  json({
    data: {},
    affordances: []
  })
end

get '/product/:vendor_id' do
  json({
    data: {},
    affordances: [{:link_relation=>"products", :url=>"http://localhost:4567/products", :http_method=>"GET", :params=>nil}]
  })
end

get '/vendors/:vendor_id' do
  json({
    data: {},
    affordances: [{:link_relation=>"products", :url=>"http://localhost:4567/products", :http_method=>"GET", :params=>nil}]
  })
end

get '/products' do
  json({
    data: {"rating"=>[1, 2, 3]},
    affordances: [{:link_relation=>"product_id", :url=>"http://localhost:4567/products/:product_id", :http_method=>"GET", :params=>nil}, {:link_relation=>"by_rating", :url=>"http://localhost:4567/products?by_rating", :http_method=>"GET", :params=>{"?by_rating"=>"rating"}}]
  })
end

get '/' do
  json({
    data: {},
    affordances: [{:link_relation=>"shoppe", :url=>"http://localhost:4567/homepage", :http_method=>"GET", :params=>nil}]
  })
end

