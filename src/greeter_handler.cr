require "./protobufs/hello_world_services.pb"
require "./protobufs/hello_world.pb"

class GreeterHandler < Greeter
  # You can define your own initialize method to inject dependencies

  def say_hello(request : ::HelloRequest) : ::HelloReply
    if name = request.name
      HelloReply.new(message: "Hello #{name}")
    else
      HelloReply.new(message: "Howdy Pardner")
    end
  end

  def say_hello_again(request : ::HelloRequest) : ::HelloReply
    if name = request.name
      HelloReply.new(message: "Hello again #{name}")
    else
      HelloReply.new(message: "Howdy again Pardner")
    end
  end
end
