#
# Cloudera Kudu Dockerfile
#

# Pull the base image.
FROM bigboards/base-__arch__

MAINTAINER bigboards

USER root

ADD cloudera.list /etc/apt/sources.list.d/
RUN apt-get update && apt-get install -y --force-yes kudu libkuduclient0 libkuduclient-dev

ADD kudu.sh /usr/bin/kudu.sh
RUN chmod a+x /usr/bin/kudu.sh

# Define default command.
CMD ["/bin/bash"]