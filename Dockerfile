FROM openjdk:jdk-slim

ENV GHIDRA_RELEASE_TAG Ghidra_10.1.2_build
ENV GHIDRA_VERSION ghidra_10.1.2_PUBLIC_20220125

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip fontconfig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/NationalSecurityAgency/ghidra/releases/download/${GHIDRA_RELEASE_TAG}/${GHIDRA_VERSION}.zip && \
    unzip -d ghidra ${GHIDRA_VERSION}.zip && \
    rm ${GHIDRA_VERSION}.zip && \
    mv ghidra/ghidra_* /opt/ghidra

ENV PATH="/opt/ghidra:/opt/ghidra/support:${PATH}"
