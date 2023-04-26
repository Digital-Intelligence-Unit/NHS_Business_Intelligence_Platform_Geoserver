FROM kartoza/geoserver:2.23.0

ENV \
    JAVA_HOME=/usr/lib/jvm/default-java \
    DEBIAN_FRONTEND=noninteractive \
    GEOSERVER_DATA_DIR=/opt/geoserver/data_dir \
    GDAL_DATA=/usr/local/gdal_data \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/gdal_native_libs:/usr/local/apr/lib:/opt/libjpeg-turbo/lib64" \
    FOOTPRINTS_DATA_DIR=/opt/footprints_dir \
    GEOWEBCACHE_CACHE_DIR=/opt/geoserver/data_dir/gwc \
    ENABLE_JSONP=true \
    MAX_FILTER_RULES=20 \
    OPTIMIZE_LINE_WIDTH=false \
    JAVA_VERSION= \
    JAVA_DEBIAN_VERSION= \
    GEOSERVER_ADMIN_PASSWORD=digitalintelligenceunit1957

ARG PGDATABASE

# Copy data
COPY data_dir $GEOSERVER_DATA_DIR

# Set database details
RUN sed -i "s/PGDATABASE/$PGDATABASE/g" $GEOSERVER_DATA_DIR/workspaces/DIUPostgres/tables/datastore.xml

ENV \
    ## Initial Memory that Java can allocate
    INITIAL_MEMORY="2G" \
    ## Maximum Memory that Java can allocate
    MAXIMUM_MEMORY="4G"