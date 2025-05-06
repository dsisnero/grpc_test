require "grpc"
require "grpc/http2"
require "./greeter_handler"

def main
  hostname_port = (ARGV.size > 0) ? ARGV[0] : "localhost:8080"
  hostname, port_string = hostname_port.split(":")
  port = port_string.to_i32
  pp! hostname
  pp! port
  grpc = GRPC::Server.new
  grpc << GreeterHandler.new

  server = HTTP2::ClearTextServer.new([grpc])
  server.listen hostname, port
end

main
