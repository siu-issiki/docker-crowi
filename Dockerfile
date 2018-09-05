FROM crowi/crowi:$CROWI_VERSION

RUN curl -SL -o /usr/local/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
	&& chmod +x /usr/local/bin/wait-for-it.sh

ENTRYPOINT ["/entrypoint.sh"]