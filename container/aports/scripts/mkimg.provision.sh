profile_provision() {
	profile_virt
	title="Provision-ready"
	desc="VM image, ready for provisioning by another tool."
	arch="x86 x86_64"
	kernel_addons=
	kernel_flavors="virt"
	kernel_cmdline="console=tty0 console=ttyS0,115200"
	syslinux_serial="0 115200"
	apks="$apks openssh python3"
     apkovl="genapkovl-dhcp.sh"
}
