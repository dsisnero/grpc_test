require "rake"
require "pathname"

path = Pathname(__dir__)

cmd = <<-PROTOC
  protoc -I protos ^
      --grpc_out=#{path}/src/protobufs ^
      --crystal_out=#{path}/src/protobufs ^
      --plugin=protoc-gen-grpc=#{path}/bin/grpc_crystal.exe ^
      --plugin=protoc-gen-crystal=#{path}/bin/protoc-gen-crystal.exe ^
      #{path}/protos/hello_world.proto
PROTOC

desc "run proto"
task :protoc do
  sh cmd
end

task default: :protoc
