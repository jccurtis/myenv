# Logical Volume Management (LVM) Setup Notes

Using Ubuntu 16.04

Install `lvm`:

```bash
sudo apt-get install lvm2
```

I had to config further ([ref](https://unix.stackexchange.com/questions/199164/error-run-lvm-lvmetad-socket-connect-failed-no-such-file-or-directory-but)) with:

```bash
sudo systemctl enable lvm2-lvmetad.service
sudo systemctl enable lvm2-lvmetad.socket
sudo systemctl start lvm2-lvmetad.service
sudo systemctl start lvm2-lvmetad.socket
```
