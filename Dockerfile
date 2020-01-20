FROM ruby:2.7.0

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev ghostscript

RUN mkdir -p /app
RUN mkdir -p /usr/local/nvm
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.0.2
RUN gem install foreman -v 0.85.0
RUN bundle install --verbose --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]