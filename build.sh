#!/usr/bin/env bash

function build_nginx() {
  CONTRIB_PATH=~/nginx/modules/contrib;
  cd ~/nginx/nginx;
  ./configure \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_spdy_module \
    --add-module=${CONTRIB_PATH}/ngx_devel_kit \
    --add-module=${CONTRIB_PATH}/array-var-nginx-module \
    --add-module=${CONTRIB_PATH}/encrypted-session-nginx-module \
    --add-module=${CONTRIB_PATH}/headers-more-nginx-module \
    --add-module=${CONTRIB_PATH}/memc-nginx-module \
    --add-module=${CONTRIB_PATH}/ngx_http_geoip2_module \
    --add-module=${CONTRIB_PATH}/redis2-nginx-module \
  ;

  make;

  cd ~/nginx;
}

build_nginx
