Cobbler
=======

Install cobbler.

Role Variables
--------------
## Required variables

You must at least set the following variables for each hosts:

```
cobbler_default_password: to@change
cobbler_server: 192.168.168.202
cobbler_next_server: 192.168.168.202
cobbler_subnet: 192.168.168.0
cobbler_netmask: 255.255.255.0
cobbler_dynamic_bootp_start: 192.168.168.128
cobbler_dynamic_bootp_end: 192.168.168.172
```

The example of inventory file is:

```
[cobbler]
vagrant1
```

The example of host_vars/vagrant1 file is:  

```
---

# required
cobbler_default_password: to@change
cobbler_server: 172.16.7.18
cobbler_next_server: 172.16.7.18
cobbler_subnet: 172.16.7.0
cobbler_netmask: 255.255.255.0
cobbler_dynamic_bootp_start: 172.16.7.192
cobbler_dynamic_bootp_end: 172.16.7.208

# optional
cobbler_distros:
  - distro_name: CentOS-7.1
    device_or_iso_path: /dev/sr0
    arch: x86_64

cobbler_install_web: true
cobbler_web_user_pwd:
  - user_name: cobbler
    password: to!change
```


## Optional variables

```
# set the timezone
cobbler_default_time_zone: "Asia/Shanghai"   # America/New_York

# routers for pxe client
cobbler_routers: 192.168.168.1

# dns for pxe client
cobbler_domain_name_servers: 192.168.168.1

# import a distro and profile
cobbler_distros:
  - distro_name: CentOS-7.1
    device_or_iso_path: /dev/sr0  # /data/CentOS-7-x86_64-DVD-1503-01.iso
    arch: x86_64

# install cobbler web ui
cobbler_install_web: true
 cobbler_web_user_pwd:
  - user_name: cobbler
    password: Change!me
```


Example Playbook
----------------

```
- hosts: cobbler
  become: true
  roles:
  - frank6866.cobbler
```

License
-------

MIT
