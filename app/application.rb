class Application

  def call(env)
    resp = Rack::Response.new
      #an object from Rack initialized upon call that contains response 
    req = Rack::Request.new(env)
      #an object from Rack that contains the request via env
       #can access object req in our pry, for ex, and see encapsulated infor - request URI, path info, etc..
       #we really care about path - req.path - which should correspond to a route we created - req.path === req.path(/trips/)
       #if a match then go ahead and return [...]

    if req.path.match(/newtrip/) #if .com/test then run this request
      if req.env["REQUEST_METHOD"] === 'GET'
        return [200, { 'Content-Type' => 'application/json' }, [ "get".to_json ]]
      elsif req.env["REQUEST_METHOD"] === 'POST'
        return [200, { 'Content-Type' => 'application/json' }, [ "post".to_json ]]
      end

    elsif req.path.match(/trips/)
      return [200, { 'Content-Type' => 'application/json' }, [ Trip.all.to_json ]]


    elsif req.path.match(/riders/)
      if req.env["REQUEST_METHOD"] === 'GET'
        
        if (req.path.split("/riders").length === 0)
          return [200, { 'Content-Type' => 'application/json' }, [ Rider.all.to_json ]]
            #req.path contains the owner id we need to isolate our Rider
            #req.path.split("/riders").last[1]
            #check .length of path to isolate pathways
        else
          rider_id = req.path.split("/riders/").last.to_i
          rider = Rider.find_by(id: rider_id)
          return [200, { 'Content-Type' => 'application/json' }, [ rider.to_json ]]
        end


      elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        newRider = Rider.create(name: input["rider"], rating: rand(1..5))
        Trip.create(distance: rand(1..100), price: rand(1..100), rider_id: newRider.id, driver_id: Driver.ids.sample)
        return [200, { 'Content-Type' => 'application/json' }, [ Rider.all.to_json ]]
       
      end

            #status code, { fetch request-like => } return the headers, and then our array [] of objects/data
            #POST method needs its own if statement to process incoming data/req
            #if req.env["REQUEST_METHOD"] === 'POST'
              #return JSON -> parse into RUBY friendly code
              #input = JSON.parse(req.body.read)
              #input["name"] = "Bob"
              #Rider.create(name: input["name"]...) will create our new db entry
    elsif req.path.match(/drivers/)
      return [200, { 'Content-Type' => 'application/json' }, [ Driver.all.to_json ]]

    else
      resp.write "Path Not Found" 
    end
    resp.finish
  end

end
