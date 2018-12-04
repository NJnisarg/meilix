FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils debconf-utils dialog
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt-get update
RUN apt-get install -y resolvconf
RUN apt-get install cpio sudo -y
RUN apt-get clean
RUN apt-get update
RUN apt-get install -qq debootstrap genisoimage p7zip-full squashfs-tools ubuntu-dev-tools -y --no-install-recommends
RUN apt-get -qq install dpkg-dev debhelper fakeroot
RUN apt-get -qq install devscripts
RUN apt-get -qq install tree
RUN apt-get -qq install binwalk
COPY . .
RUN chmod +x ./build.sh
CMD ["/bin/bash","./build.sh"]
