FROM rails:4.2.4
MAINTAINER Ed Brady <eddiemacmac@hotmail.com>

ENV APP_ROOT /usr/src/app
ENV VIDEO_DIR $APP_ROOT/public/videos
# Must be subdirectories of video directory and not include trailing slash
ENV SERIES_SUBDIR Episodes 
ENV DOCUMENTARY_SUBDIR Documentary 
ENV MOVIES_SUBDIR Movies 

ADD . $APP_ROOT

WORKDIR $APP_ROOT

RUN bundle install

EXPOSE 3000
CMD [ "rails", "server", "-b", "0.0.0.0" ]
