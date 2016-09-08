image:
	docker build -t renderedtext/elixir-thrift-dev .
	docker run --name etd_container -tdi renderedtext/elixir-thrift-dev
test:
	bash test/test.sh
release:
	bash push-to-dockerhub.sh
