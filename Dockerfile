FROM kartoza/geoserver:2.15.0

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

WORKDIR /scripts

COPY data_dir $GEOSERVER_DATA_DIR
# ADD resources /tmp/resources
# ADD scripts /scripts
# RUN chmod +x /scripts/*.sh
# ADD scripts/controlflow.properties $GEOSERVER_DATA_DIR
# ADD scripts/sqljdbc4-4.0.jar $CATALINA_HOME/webapps/geoserver/WEB-INF/lib/

# RUN /scripts/setup.sh \
#     && groupadd -r geoserver && useradd --no-log-init -r -g geoserver geoserver \
#     && chown --verbose --recursive geoserver:geoserver /opt/geoserver \
#     && chown --verbose --recursive geoserver:geoserver /opt/footprints_dir \
#     && chown --verbose --recursive geoserver:geoserver /usr/local/tomcat \
#     && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  \
#     && dpkg --remove --force-depends  unzip

RUN sed -i "s/PGDATABASE/$PGDATABASE/g" $GEOSERVER_DATA_DIR/workspaces/MosaicHousehold/PostGISStore/datastore.xml

ENV \
    ## Initial Memory that Java can allocate
    INITIAL_MEMORY="2G" \
    ## Maximum Memory that Java can allocate
    MAXIMUM_MEMORY="4G"

# USER geoserver

CMD ["/scripts/entrypoint.sh"]
