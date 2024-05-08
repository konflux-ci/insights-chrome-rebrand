FROM quay.io/cloudservices/insights-chrome-frontend:9ddfec6

COPY build /build
COPY build/favicon.svg /opt/app-root/src/build/stable/
RUN cd /build && ./rebrand.sh && cd / && rm -r build
