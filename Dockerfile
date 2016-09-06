FROM msaraiva/elixir-dev

RUN apk --update add erlang-xmerl curl bash

RUN curl https://gist.githubusercontent.com/shiroyasha/c6880588d57c109ffc2fbb52c4bad663/raw/3073b359066d87198cb668e81fa504612f258c93/alpine-install-thrift | sh

CMD ["/bin/sh"]



