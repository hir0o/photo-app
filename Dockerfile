FROM ruby:2.6.2
RUN apt-get update -qq &&  \
    apt-get install --no-install-recommends -y nodejs postgresql-client && \
    apt-get install -y vim

RUN mkdir /photo-app
WORKDIR /photo-app
COPY Gemfile /photo-app/Gemfile
COPY Gemfile.lock /photo-app/Gemfile.lock
RUN bundle install
COPY . /photo-app
RUN mkdir -p tmp/sockets
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]