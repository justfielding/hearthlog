#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

### change group owner to admin for /dev/bpf*
chgrp admin /dev/bpf*

### change permissions to rw for group
chmod g+rw /dev/bpf*

exit 0

