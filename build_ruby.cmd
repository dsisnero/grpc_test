
protoc -I protos ^
    --ruby_out=./ruby/lib ^
    protos\hello_world.proto
