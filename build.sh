#!/usr/bin/env bash

function build_nginx() {
  set -e;
  local BASE_DIR=~/nginx;
  local MODULES_PATH=${BASE_DIR}/modules;
  local CONTRIB_PATH=${MODULES_PATH}/contrib;
  local RESTY_PATH=${MODULES_PATH}/openresty;
  local BUILD_PATH=${BASE_DIR}/objs;
  local CORE_DIR=${BASE_DIR}/core;

  local NGINX_PROXY_PREFIX_PATH=/usr/local/nginx-proxy
  cd ${CORE_DIR};
  ./configure \
    --builddir=${BUILD_PATH} \
    --prefix=${NGINX_PROXY_PREFIX_PATH} \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_spdy_module \
    --without-http_fastcgi_module \
    --without-http_uwsgi_module \
    --without-http_scgi_module \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module \
    --add-module=${CONTRIB_PATH}/ngx_devel_kit \
    --add-module=${CONTRIB_PATH}/nginx-length-hiding-filter-module \
    --add-module=${CONTRIB_PATH}/array-var-nginx-module \
    --add-module=${CONTRIB_PATH}/encrypted-session-nginx-module \
    --add-module=${CONTRIB_PATH}/headers-more-nginx-module \
    --add-module=${CONTRIB_PATH}/ngx_http_geoip2_module \
    --add-module=${CONTRIB_PATH}/redis2-nginx-module \
    --add-module=${CONTRIB_PATH}/ngx_pagespeed \
    ;
    make;
    sudo make install;
    cd ${BASE_DIR};

}

build_nginx
