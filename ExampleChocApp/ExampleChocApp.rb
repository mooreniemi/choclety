require 'sinatra'
require 'json'


get '/homepage' do
  {
    data: {},
    affordances: ["product", "categories", "vendors"]
  }.to_json
end

get '/product' do
  {
    data: {"id"=>"uuid"},
    affordances: ["products/:product_id/reviews", "cart", "product/:vendor_id"]
  }.to_json
end

get '/categories' do
  {
    data: {},
    affordances: ["categories/:category_id"]
  }.to_json
end

get '/vendors' do
  {
    data: {},
    affordances: ["vendors/:vendor_id"]
  }.to_json
end

get '/categories/:category_id' do
  {
    data: {},
    affordances: ["products/:product_id", "products?by_rating"]
  }.to_json
end

get '/products/:product_id' do
  {
    data: {"id"=>"uuid"},
    affordances: ["products/:product_id/reviews", "cart", "product/:vendor_id"]
  }.to_json
end

get '/products?by_rating' do
  {
    data: {},
    affordances: ["products/:product_id", "products?by_rating"]
  }.to_json
end

get '/products/:product_id/reviews' do
  {
    data: {},
    affordances: ["reviews/:review_id", "review"]
  }.to_json
end

get '/reviews/:review_id' do
  {
    data: {},
    affordances: ["review"]
  }.to_json
end

post '/review' do
  {
    data: {},
    affordances: ["review"]
  }.to_json
end

put '/review' do
  {
    data: {},
    affordances: ["review"]
  }.to_json
end

post '/cart' do
  {
    data: {},
    affordances: ["cart", "invoice"]
  }.to_json
end

delete '/cart' do
  {
    data: {},
    affordances: ["cart", "invoice"]
  }.to_json
end

post '/invoice' do
  {
    data: {},
    affordances: []
  }.to_json
end

get '/product/:vendor_id' do
  {
    data: {},
    affordances: ["products"]
  }.to_json
end

get '/vendors/:vendor_id' do
  {
    data: {},
    affordances: ["products"]
  }.to_json
end

get '/products' do
  {
    data: {},
    affordances: ["products/:product_id", "products?by_rating"]
  }.to_json
end

get '/root' do
  {
    data: {},
    affordances: ["homepage"]
  }.to_json
end

