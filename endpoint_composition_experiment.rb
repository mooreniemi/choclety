require 'sinatra'
require 'json'
require 'sinatra/json'
require 'addressable/uri'

helpers do
  def transclude(params, response, path)
    query_string = Addressable::URI.new(
      query_values: response.merge(params)
    ).query

    env_hash = {
      'PATH_INFO' => "/#{path}",
      'QUERY_STRING' => query_string,
      'BODY' => response
    }

    p "transcluding #{path}"
    call env.merge(env_hash)
  end

  def respond(response)
    transclusion_stack = (params.delete('transclude') || "").split(',')
    if t = transclusion_stack.shift
      params.merge!({transclude: transclusion_stack.join(',') })
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

get '/b' do
  a = params[:a]
  p 'responding from b'
  respond({b: "#{a} + b"})
end

get '/c' do
  b = params[:b]
  p 'responding from c'
  respond({c: "#{b} + c"})
end
