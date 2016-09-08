image:
	docker build -t elixir-thrift-dev .
	docker run --name et_container -tdi elixir-thrift-dev
test:
	bash test/test.sh
release:
	bash push-to-dockerhub.sh
