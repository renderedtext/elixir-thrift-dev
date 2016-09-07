image:
	docker build -t elixir-thrift-dev .
	docker run --name et_container -tdi elixir-thrift-dev
test:
	sh test/test.sh
release:
	sh push-to-dockerhub.sh
