FROM docker.osgeo.org/geoserver:2.22.0

ENV SKIP_DEMO_DATA=true
ENV CORS_ENABLED=false

COPY build/web.xml $CATALINA_HOME/webapps/geoserver/WEB-INF/web.xml