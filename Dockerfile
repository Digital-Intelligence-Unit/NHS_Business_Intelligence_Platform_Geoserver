FROM kartoza/geoserver:2.23.0

ENV ENABLE_JSONP=true
ENV GEOSERVER_ADMIN_PASSWORD=SDdjgre43@xvc

# Copy data
COPY geoserver_data $GEOSERVER_DATA_DIR
COPY settings/web.xml "${CATALINA_HOME}"/conf/

# Set database details
RUN sed -i "s/PGDATABASE/$PGDATABASE/g" $GEOSERVER_DATA_DIR/workspaces/DIUPostgres/tables/datastore.xml