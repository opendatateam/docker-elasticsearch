##########################################
# Dockerfile for udata base system
# Based on Debian
##########################################

FROM elasticsearch:2.4.5-alpine

# Install uData system dependencies
RUN plugin install analysis-icu

# Install curl for healthcheck
RUN apk add --no-cache curl

# Provide healthcheck for Docker 1.12+
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:9200/ || exit 1
