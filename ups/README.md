**/etc/nut/ups.conf**
```
[salicru]
driver = blazer_usb
port = auto
desc = "Salicru UPS"
pollinterval = 10
vendorid = 0665
productid = 5161
```

**/etc/nut/nut.conf**
```
MODE=standalone
```

```
usermod -aG nut pi
newgrp nut
udevadm control --reload-rules
udevadm trigger
upsdrvctl start salicru
```

```
upsc salicru
```
