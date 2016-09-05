FROM continuumio/miniconda:latest

RUN apt-get update -y --fix-missing && \
  apt-get -y install \
  mecab \
  libmecab-dev \
  mecab-ipadic-utf8 \
  git \
  make \
  curl \
  xz-utils \
  file \
  gcc \
  g++


RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd && \
  cd /tmp/neologd && \
  ./bin/install-mecab-ipadic-neologd -n -u -y && \
  rm -rf /tmp/neologd

# echo "ももいろクローバー" mecab -d `mecab-config --dicdir`"/mecab-ipadic-neologd"

RUN git clone --depth 1 https://github.com/taku910/mecab.git /tmp/mecab && \
  cd /tmp/mecab/mecab/python && \
  python setup.py build && \
  python setup.py install

# python -c "import MeCab; print(MeCab.Tagger('-d /usr/lib/mecab/dic/mecab-ipadic-neologd').parse('ももいろクローバー'))"

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]
