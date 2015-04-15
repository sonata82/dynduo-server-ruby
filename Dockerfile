FROM rails:onbuild

RUN bundle config --global frozen 0
RUN bundle config --global path vendor/bundle