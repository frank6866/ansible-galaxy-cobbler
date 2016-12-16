Cobbler
=======

Install cobbler.


Role Variables
--------------

```
cobbler_default_time_zone: "Asia/Shanghai"   # America/New_York

# /etc/cobbler/settings
cobbler_manage_dhcp: 1 # default
cobbler_default_password: to@change # default
cobbler_server: 192.168.168.202
cobbler_next_server: 192.168.168.202


# /etc/cobbler/dhcp.template
cobbler_subnet: 192.168.168.0
cobbler_netmask: 255.255.255.0
cobbler_dynamic_bootp_start: 192.168.168.128
cobbler_dynamic_bootp_end: 192.168.168.172

cobbler_routers: 192.168.168.1
cobbler_domain_name_servers: 192.168.168.1
cobbler_subnet_mask: 255.255.255.0

# option
cobbler_distros:
  CentOS-7.1-minimal:
    distro_name: CentOS-7.1
    device_or_iso_path: /dev/sr0  # /data/CentOS-7-x86_64-DVD-1503-01.iso
    arch: x86_64

# option
cobbler_install_web: true
```


Example Playbook
----------------

```
    - hosts: servers
      become: true
      roles:
         - { role: frank6866.cobbler }
```

License
-------

MIT
