## Generated from hello_world.proto
require "protobuf"


struct HelloRequest
  include ::Protobuf::Message
  
  contract_of "proto3" do
    optional :name, :string, 1
  end
end

struct HelloReply
  include ::Protobuf::Message
  
  contract_of "proto3" do
    optional :message, :string, 1
  end
end
