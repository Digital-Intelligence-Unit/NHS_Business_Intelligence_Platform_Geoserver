FROM kartoza/geoserver:2.23.0

ARG PGDATABASE
ENV PGDATABASE ${PGDATABASE}
ARG POSTGRES_UN
ENV POSTGRES_UN ${POSTGRES_UN}
ARG POSTGRES_PW
ENV POSTGRES_PW ${POSTGRES_PW}
ARG GEOSERVER_ADMIN_PASSWORD
ENV GEOSERVER_ADMIN_PASSWORD ${GEOSERVER_ADMIN_PASSWORD}

ENV ENABLE_JSONP=true
ENV GEOSERVER_ADMIN_PASSWORD=$GEOSERVER_ADMIN_PASSWORD

# To-do: Change to environment variable
ENV HTTP_PROXY_NAME=geoserver.dev.lancashireandsouthcumbriasis.nhs.uk
ENV HTTP_SCHEME=https

# Copy data
COPY geoserver_data $GEOSERVER_DATA_DIR
COPY settings/web.xml "${CATALINA_HOME}"/conf/

# Set database details
RUN sed -i "s/PGDATABASE/$PGDATABASE/g" $GEOSERVER_DATA_DIR/workspaces/DIUPostgres/PostGISStore/datastore.xml
RUN sed -i "s/POSTGRES_UN/$POSTGRES_UN/g" $GEOSERVER_DATA_DIR/workspaces/DIUPostgres/PostGISStore/datastore.xml
RUN sed -i "s/POSTGRES_PW/$POSTGRES_PW/g" $GEOSERVER_DATA_DIR/workspaces/DIUPostgres/PostGISStore/datastore.xml
