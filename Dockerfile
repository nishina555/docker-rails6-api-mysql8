FROM ruby:2.7.1

# 作業ディレクトリを/appに指定
WORKDIR /app

# ローカルのGemfileをDokcerにコピー
COPY Gemfile* /app/

# /appディレクトリ上でbundle install
RUN bundle install
