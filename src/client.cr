require "./protobufs/hello_world_services.pb"
require "./protobufs/hello_world.pb"

def main
  user = (ARGV.size > 0) ? ARGV[0] : "world"
  hostname_arg = (ARGV.size > 1) ? ARGV[1] : "localhost:5001"
  pp! hostname_arg
  hostname, port = hostname_arg.split(":")
  port = port ? port.to_i32 : 5001
  pp! hostname
  pp! port
  stub = Greeter::Stub.new("localhost", 50000)
  message = stub.say_hello(HelloRequest.new(name: user)).message
  p "Greeting: #{message}"
  message = stub.say_hello_again(HelloRequest.new(name: user)).message
  p "Greeting: #{message}"
end

main
