#!/usr/bin/env bash

function build_nginx() {
  local BASE_DIR=~/nginx;
  local CONTRIB_PATH=${BASE_DIR}/modules/contrib;
  local RESTY_PATH=${BASE_DIR}/modules/openresty;

  local BUILD_PATH=${BASE_DIR}/objs;
  local CORE_DIR=${BASE_DIR}/core;
  cd ${CORE_DIR};
  ./configure \
    --builddir=${BUILD_PATH} \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_spdy_module \
    --add-module=${CONTRIB_PATH}/ngx_devel_kit \
    --add-module=${CONTRIB_PATH}/nginx-length-hiding-filter-module \
    --add-module=${CONTRIB_PATH}/array-var-nginx-module \
    --add-module=${CONTRIB_PATH}/encrypted-session-nginx-module \
    --add-module=${CONTRIB_PATH}/headers-more-nginx-module \
    --add-module=${CONTRIB_PATH}/ngx_http_geoip2_module \
    --add-module=${CONTRIB_PATH}/redis2-nginx-module \
  ;

  make;
  make install;
  cd ${BASE_DIR};
}

build_nginx
