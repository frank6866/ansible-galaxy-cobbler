Cobbler
=======

Install cobbler.

Role Variables
--------------



```
---

### cobbler server
cobbler_default_password: changE_me
cobbler_default_time_zone: "Asia/Shanghai"   # America/New_York
cobbler_manage_dhcp: 1 # default
cobbler_pxe_just_once: 1
cobbler_server: 192.168.168.200
cobbler_next_server: 192.168.168.200
cobbler_subnet: 192.168.168.0
cobbler_netmask: 255.255.255.0
cobbler_dynamic_bootp_start: 192.168.168.128
cobbler_dynamic_bootp_end: 192.168.168.172
cobbler_routers: 192.168.168.1
cobbler_domain_name_servers: 192.168.168.1
cobbler_subnet_mask: 255.255.255.0


# cobbler web
cobbler_install_web: true
cobbler_web_user_pwd:
 - user_name: cobbler
   password: Change!me
 - user_name: test1
   password: Change@me


# import distros
cobbler_distros:
  - distro_name: CentOS-7.1-sda
    device_or_iso_path: /dev/sr0
    arch: x86_64
    kickstart_file_name: centos7-customized-sda

# public keys for root.(optional)
cobbler_root_public_keys:
  - xxxxxxxx


```




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

Test
-----
> $ sudo cobbler system add --name=pxe-test --profile=CentOS-7.1-sda-x86_64 --hostname=hn-pxe-test --mac=08:00:27:95:9F:2B --ip-address=192.168.168.199 --subnet=255.255.255.0 --gateway=192.168.168.1 --static=1 --interface=not_used



License
-------

MIT
