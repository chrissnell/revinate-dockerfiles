# Use base Ubuntu image from the Docker folks
FROM ubuntu

# Snelly
MAINTAINER Chris Snell, chris.snell@revinate.com

# Make sure repo is up to date
RUN apt-get update

# Install memcached
RUN apt-get install -y memcached

# Install netcat (used for testing memcache)
RUN apt-get install -y netcat

# Start up memcached in daemon mode, allocating 4000 MB of memory
ENTRYPOINT ["memcached", "-u", "nobody", "-m", "4000", "logfile", "/var/log/memcached.log"]

# Expose memcached port
EXPOSE 11211
