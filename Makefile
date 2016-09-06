init:
	make build
	make test
	make release
image:
	docker build -t elixir-thrift .
	docker run --name et_container -tdi elixir-thrift
test:
	sh docker-thrift.sh

