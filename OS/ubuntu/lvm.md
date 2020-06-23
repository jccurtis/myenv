# Logical Volume Management (LVM) Setup Notes

Using Ubuntu 16.04 and following these [instructions](https://www.digitalocean.com/community/tutorials/how-to-use-lvm-to-manage-storage-devices-on-ubuntu-16-04).

Install `lvm`:

```bash
sudo apt-get install -y lvm2
```

I had to config further ([ref](https://unix.stackexchange.com/questions/199164/error-run-lvm-lvmetad-socket-connect-failed-no-such-file-or-directory-but)) with:

```bash
sudo systemctl enable lvm2-lvmetad.service
sudo systemctl enable lvm2-lvmetad.socket
sudo systemctl start lvm2-lvmetad.service
sudo systemctl start lvm2-lvmetad.socket
```

Check for existing volume groups:

```bash
sudo vgdisplay -v
```


Check available disks:

```bash
fdisk -l
```

and:

```bash
sudo lvmdiskscan
```

Clean disk(s):

```bash
sudo wipefs -a /dev/sdb
```

Mark volumes as physical volumes for LVM:

```bash
sudo pvcreate /dev/sdb /dev/sdc
```

Create volume group:

```bash
sudo vgcreate vgpool /dev/sdb /dev/sdc
```

Create logical volume:

```bash
sudo lvcreate -l 100%FREE -n project vgpool
```

Add a filesystem:

```bash
sudo mkfs.ext4 /dev/vgpool/project
```

Get the LV uuid:

```bash
sudo blkid -l
```

Create mount point:

```bash
sudo mkdir -p /project
```

Setup to automount by adding the following line to `/etc/fstab`:

```bash
/dev/vgpool/project /project ext4 defaults 0 0
```
