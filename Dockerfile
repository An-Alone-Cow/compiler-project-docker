FROM i686/ubuntu

RUN apt-get update
RUN apt-get install -y \
  flex \
  bison \
  build-essential \
  csh \
  libxaw7-dev

ENV PATH="/cool/bin/:${PATH}"

WORKDIR /codes/

CMD tail -f /dev/null
