# # Generated from hello_world.proto
require "grpc/service"

abstract class Greeter
  include GRPC::Service

  @@service_name = "Greeter"

  rpc SayHello, receives: ::HelloRequest, returns: ::HelloReply
  rpc SayHelloAgain, receives: ::HelloRequest, returns: ::HelloReply
end
