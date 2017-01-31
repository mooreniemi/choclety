# prereqs:
# gem install sinatra
# gem install sinatra-contrib

# then run with: ruby endpoint_composition_experiment.rb
# http://localhost:4567/a
# => {"a":"a"}
# http://localhost:4567/a?compose=!b
# => {"b":"a + b"}
# http://localhost:4567/a?compose=!b,c
# => {"c":"a + b + c"}

require 'sinatra'
require 'json'
require 'sinatra/json'
require 'addressable/uri'

COMPOSITION_PREFIX = /([!\-+]?)(.*)/
COMPOSITION = {'+': 'PUT', '!': 'POST', '-': 'DELETE'}
COMPOSITION.default = 'GET'
COMPOSITION.freeze

helpers do
  def compose(params, response, path)
    prefix, path = COMPOSITION_PREFIX.match(path)[1], COMPOSITION_PREFIX.match(path)[2]

    query_string = Addressable::URI.new(
      query_values: response.merge(params)
    ).query

    env_hash = {
      'PATH_INFO' => "/#{path}",
      'QUERY_STRING' => query_string,
      'BODY' => response,
      'REQUEST_METHOD' => COMPOSITION[prefix.to_sym]
    }

    p "composing #{path}"
    call env.merge(env_hash)
  end

  def respond(response)
    composition_stack = (params.delete('compose') || "").split(',')
    if t = composition_stack.shift
      params.merge!({ compose: composition_stack.join(',') })
      status, headers, body = compose(params, response, t)
      [status, headers, body]
    else
      json(response)
    end
  end
end

get '/a' do
  p 'responding from a'
  respond({a: "a"})
end

post '/b' do
  a = params[:a]
  p 'responding from b'
  respond({b: "#{a} + b"})
end

get '/c' do
  body = env['BODY']
  p 'responding from c'
  respond({c: ((body || {}).values + ['c']).join(' + ')})
end
