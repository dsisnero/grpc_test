require "grpc"
require "grpc/http2"
require "./greeter_handler"

grpc = GRPC::Server.new
grpc << GreeterHandler.new

server = HTTP2::ClearTextServer.new([grpc])
server.listen "localhost", 50000
