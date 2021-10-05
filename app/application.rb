class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) #if .com/test then run this request
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    elsif req.path.match(/trips/)
      return [200, { 'Content-Type' => 'application/json' }, [ Trip.all.to_json ]]

    elsif req.path.match(/riders/)
      return [200, { 'Content-Type' => 'application/json' }, [ Rider.all.to_json ]]

    elsif req.path.match(/drivers/)
      return [200, { 'Content-Type' => 'application/json' }, [ Driver.all.to_json ]]

    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
