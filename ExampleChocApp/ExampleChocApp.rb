require 'sinatra'
require 'sinatra/json'


get '/homepage' do
  json({
    data: {},
    affordances: ["product", "categories", "vendors"]
  })
end

get '/product' do
  json({
    data: {"id"=>"uuid"},
    affordances: ["products/:product_id/reviews", "cart", "product/:vendor_id"]
  })
end

get '/categories' do
  json({
    data: {},
    affordances: ["categories/:category_id"]
  })
end

get '/vendors' do
  json({
    data: {},
    affordances: ["vendors/:vendor_id"]
  })
end

get '/categories/:category_id' do
  json({
    data: {},
    affordances: ["products/:product_id", "products?by_rating"]
  })
end

get '/products/:product_id' do
  json({
    data: {"id"=>"uuid"},
    affordances: ["products/:product_id/reviews", "cart", "product/:vendor_id"]
  })
end

get '/products?by_rating' do
  json({
    data: {},
    affordances: ["products/:product_id", "products?by_rating"]
  })
end

get '/products/:product_id/reviews' do
  json({
    data: {},
    affordances: ["reviews/:review_id", "review"]
  })
end

get '/reviews/:review_id' do
  json({
    data: {},
    affordances: ["review"]
  })
end

post '/review' do
  json({
    data: {},
    affordances: ["review"]
  })
end

put '/review' do
  json({
    data: {},
    affordances: ["review"]
  })
end

post '/cart' do
  json({
    data: {},
    affordances: ["cart", "invoice"]
  })
end

delete '/cart' do
  json({
    data: {},
    affordances: ["cart", "invoice"]
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
    affordances: ["products"]
  })
end

get '/vendors/:vendor_id' do
  json({
    data: {},
    affordances: ["products"]
  })
end

get '/products' do
  json({
    data: {},
    affordances: ["products/:product_id", "products?by_rating"]
  })
end

get '/root' do
  json({
    data: {},
    affordances: ["homepage"]
  })
end

