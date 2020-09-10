./mkimage.sh --tag ${ISO_TAG} --outdir /iso --arch ${ISO_ARCH} --repository ${ISO_REPOSITORY} --profile provision

if [ ! -z "$ISO_UID" ]
then
     chown $ISO_UID /iso/*.iso
fi

if [ ! -z "$ISO_GID" ]
then
     chgrp $ISO_GID /iso/*.iso
fi
