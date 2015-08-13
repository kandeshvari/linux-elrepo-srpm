FILES = 0001-cgroup-add-network-limits-subsystem.patch config-4.1.5-i686 config-4.1.5-i686-NONPAE config-4.1.5-x86_64 kernel-ml.spec
LKAver = $(shell grep '%define LKAver' kernel-ml.spec | awk '{print $$3}')

all:
	mkdir -p ~/rpmbuild/SOURCES
	mkdir -p ~/rpmbuild/BUILD
	mkdir -p ~/rpmbuild/BUILDROOT
	mkdir -p ~/rpmbuild/RPMS
	mkdir -p ~/rpmbuild/SRPMS
	if ! [ -f ~/rpmbuild/SOURCES/linux-$(LKAver).tar.xz ]; then \
		wget -O ~/rpmbuild/SOURCES/ ftp://ftp.kernel.org/pub/linux/kernel/v4.x/linux-$(LKAver).tar.xz; \
	fi
	cp $(FILES) ~/rpmbuild/SOURCES/
	rpmbuild -bs kernel-ml.spec
	if [ $$? -ne 0 ]; then exit $$?; fi
	rpmbuild --rebuild ~/rpmbuild/SRPMS/kernel-ml-$(LKAver)-1.jet9.net_lim.el6.nosrc.rpm


