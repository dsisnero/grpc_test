
protoc -I protos ^
    --grpc_out=src/protobufs ^
    --crystal_out=src/protobufs ^
    --plugin=protoc-gen-grpc=bin\grpc_crystal.exe ^
    --plugin=protoc-gen-crystal=bin\protoc-gen-crystal.exe ^
    protos\hello_world.proto
