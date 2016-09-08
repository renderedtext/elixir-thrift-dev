FROM msaraiva/elixir-dev

RUN apk --update add erlang-xmerl curl bash

# Gets a script that is used to install Thrift on Alpine. This can't be done through a package
# because no Thrift package exists for Alpine currently. The script is then run.
RUN curl https://gist.githubusercontent.com/shiroyasha/c6880588d57c109ffc2fbb52c4bad663/raw/3073b359066d87198cb668e81fa504612f258c93/alpine-install-thrift | sh

WORKDIR /release

CMD ["/bin/sh"]
