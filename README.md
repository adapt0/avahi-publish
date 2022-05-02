# avahi-publish

Used to publish additional Avahi hosts on a TrusNAS Scale system. Useful to avoid needing to touch the main configuration.

Includes a script which invokes `avahi-publish` with the host names provided as command arguments:

```
gitea plex
```

These will be published via the system's Avahi service to resolve back to the main system IP.

This Docker image requires access to the system's dbus to query the server's hostname and publish these hosts:

```
--mount type=bind,source=/var/run/dbus,target=/var/run/dbus
```
