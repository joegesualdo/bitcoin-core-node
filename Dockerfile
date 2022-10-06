FROM ubuntu
RUN apt update 
RUN apt install -y git
RUN apt install -y build-essential
RUN apt install -y autotools-dev 
RUN apt install -y pkg-config 
RUN apt install -y bsdmainutils 
RUN apt install -y libsqlite3-dev 
RUN apt install -y libminiupnpc-dev 
RUN apt install -y libnatpmp-dev 
RUN apt install -y libzmq3-dev 
RUN apt install -y systemtap-sdt-dev 
RUN apt install -y autoconf
RUN apt install -y libtool
RUN apt install -y make
RUN apt install -y automake
RUN apt install -y python3 
RUN apt install -y libdb-dev
RUN apt install -y libdb++-dev
RUN apt install -y libevent-dev
RUN apt install -y libboost-dev 
RUN apt install -y libboost-system-dev 
RUN apt install -y libboost-filesystem-dev
RUN apt install -y libboost-test-dev
#
RUN git clone -b v22.0 https://github.com/bitcoin/bitcoin --single-branch
#
RUN (cd bitcoin  && ./autogen.sh && \
                      ./configure --disable-tests \
                      --disable-bench --disable-static  \
                      --without-gui --disable-zmq \ 
                      --with-incompatible-bdb \
                      CFLAGS='-w' CXXFLAGS='-w' && \
                      make -j 4 && \
                      strip src/bitcoind && \
                      strip src/bitcoin-cli && \
                      strip src/bitcoin-tx && \
                      make install )
#
# Copy the bitcoin.conf file from
# the build context into the container
#
#COPY bitcoin.conf /bitcoin.conf
#
# Expose the port for the RPC interface
#
#EXPOSE 18332/tcp
 
#
# Start the bitcoin server
#
# ENTRYPOINT ["/usr/local/bin/bitcoind"]
# CMD ["-conf=/bitcoin.conf", "-testnet", "-rest=1", "-server=1", "-printtoconsole", "-txindex=1"]
