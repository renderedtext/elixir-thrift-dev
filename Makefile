image:
	docker build -t elixir-thrift .
	docker run --name et_container -tdi elixir-thrift
test:
	sh thrift-install-test.sh
