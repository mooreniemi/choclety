# prereqs:
# gem install sinatra
# gem install sinatra-contrib

# then run with: ruby endpoint_composition_experiment.rb
# http://localhost:4567/a
# => {"a":"a"}
# http://localhost:4567/a?transclude=!b
# => {"b":"a + b"}
# http://localhost:4567/a?transclude=!b,c
# => {"c":"a + b + c"}

require 'sinatra'
require 'json'
require 'sinatra/json'
require 'addressable/uri'

TRANSCLUSION_PREFIX = /([!\-+]?)(.*)/
TRANSCLUSION = {'+': 'PUT', '!': 'POST', '-': 'DELETE'}
TRANSCLUSION.default = 'GET'
TRANSCLUSION.freeze

helpers do
  def transclude(params, response, path)
    prefix, path = TRANSCLUSION_PREFIX.match(path)[1], TRANSCLUSION_PREFIX.match(path)[2]

    query_string = Addressable::URI.new(
      query_values: response.merge(params)
    ).query

    env_hash = {
      'PATH_INFO' => "/#{path}",
      'QUERY_STRING' => query_string,
      'BODY' => response,
      'REQUEST_METHOD' => TRANSCLUSION[prefix.to_sym]
    }

    p "transcluding #{path}"
    call env.merge(env_hash)
  end

  def respond(response)
    transclusion_stack = (params.delete('transclude') || "").split(',')
    if t = transclusion_stack.shift
      params.merge!({ transclude: transclusion_stack.join(',') })
      status, headers, body = transclude(params, response, t)
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
