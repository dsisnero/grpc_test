# !/usr/bin/env ruby

# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Sample gRPC server that implements the Greeter::Helloworld service.
#
# Usage: $ path/to/greeter_server.rb

require "grpc"
require "grpc/http2"
require_relative "protobufs/hello_world_services_pb"

# GreeterServer is simple server that implements the Helloworld Greeter server.
class GreeterHandler < Greeter
  # say_hello implements the SayHello rpc method.
  def say_hello(request : HelloRequest) : HelloReply
    HelloReply.new(data: "Hello #{request.name}")
  end

  def say_hello_again(request : HelloRequest) : HelloReply
    HelloReply.new(data: "Hello again, #{request.name}")
  end
end

# main starts an RpcServer that receives requests to GreeterServer at the sample
# server port.
def main
  grpc = GRPC::Server.new
  grpc << GreeterHandler.new
  server = HTTP2::ClearTextServer.new([grpc])
  server.listen "0.0.0.0", 50000
end
main
