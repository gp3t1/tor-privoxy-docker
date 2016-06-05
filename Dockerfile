FROM python:2-alpine
MAINTAINER "gp3t1@openmailbox.org"

ENV REFRESH false
ENV ACCEPT_FROM ""
ENV VERBOSE 0
ENV TORCTRL_PASS ""

ENV HTTP_PORT 8118
ENV SOCKS_PORT 9050
ENV DNS_PORT 9053
ENV TORCTRL_PORT 9051

ENV TOR_USER tor
ENV TOR_UID 500
ENV PRIVOXY_USER privoxy
ENV PRIVOXY_UID 501

EXPOSE "$HTTP_PORT" "$SOCKS_PORT" "$DNS_PORT" "$TORCTRL_PORT"

# create tor & privoxy users
RUN mkdir -p "/home/${TOR_USER}" "/home/${PRIVOXY_USER}"\
  && addgroup -g "${TOR_UID}" -S "${TOR_USER}"\
  && addgroup -g "${PRIVOXY_UID}" -S "${PRIVOXY_USER}"\
  && adduser -u "${TOR_UID}"\
    -G "${TOR_USER}"\
    -h "/home/${TOR_USER}"\
    -s "/bin/sh"\
    -D "${TOR_USER}"\
  && adduser -u "${PRIVOXY_UID}"\
    -G "${PRIVOXY_USER}"\
    -h "/home/${PRIVOXY_USER}"\
    -s "/bin/sh"\
    -D "${PRIVOXY_USER}"\
  && chown -R "${TOR_USER}:${TOR_USER}" "/home/${TOR_USER}"\
  && chown -R "${PRIVOXY_USER}:${PRIVOXY_USER}" "/home/${PRIVOXY_USER}"

#Install tor from testing and privoxy from default repo
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories\
  && apk --no-cache add curl sipcalc privoxy tor@testing\
  && pip install supervisor\
  && rm -rf /root/.cache/pip/*

COPY bin/* /usr/local/bin/
COPY etc/supervisor/* /etc/supervisor/
RUN chmod +x,go-w /usr/local/bin/*\
  && chmod -R go-w /etc/supervisor

ENTRYPOINT ["docker-entrypoint"]
CMD ["help"]