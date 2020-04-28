FROM dependabot/dependabot-core:0.117.7

RUN git clone https://github.com/dependabot/dependabot-script.git

WORKDIR /dependabot-script/
ENV SCRIPT_VERSION db966a00d0c65625008ff75d76526e9a9ad2cb63
RUN git checkout $SCRIPT_VERSION && bundle install -j 3 --path vendor

ENTRYPOINT ["bundle", "exec", "ruby", "./generic-update-script.rb"]
