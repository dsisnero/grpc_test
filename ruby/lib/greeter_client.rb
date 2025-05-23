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

# Sample app that connects to a Greeter service.
#
# Usage: $ path/to/greeter_client.rb


require "grpc"
require_relative "protobufs/hello_world_services_pb"

def main
  user = (ARGV.size > 0) ? ARGV[0] : "world"
  hostname = (ARGV.size > 1) ? ARGV[1] : "localhost:5001"
  stub = Helloworld::Greeter::Stub.new(hostname, :this_channel_is_insecure)
  begin
    message = stub.say_hello(Helloworld::HelloRequest.new(name: user)).message
    p "Greeting: #{message}"
    message = stub.say_hello_again(Helloworld::HelloRequest.new(name: user)).message
    p "Greeting: #{message}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main
