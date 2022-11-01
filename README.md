# EMAIL-FORWARD
A Docker image that forwards emails received to the specified host to another address.

# Execute
Configure incoming emails to hello@world.com to be forwarded to to@my-host.org

After setting the MX server IP for world.com,
```
sudo docker run -p 25:25 -p 587:587 --name email-forward-container winm2m/email-forward
```

# Confiture mappings
## 1. /etc/forwarding/mapping.conf
After writing from to in each line of the /etc/forwarding/mapping.conf file, execute rebuild_map
```sh
docker exec -it email-forward-container bash
echo hello to@my-host.org >> /etc/forwarding/mapping.conf
rebuild_map
```

## 2. env
Write from1:to1,from2:to... in the environment variable called EMAIL_MAPPINGS, and then execute rebuild_map
```sh
docker exec -it email-forward-container bash -c 'export EMAIL_MAPPINGS=hello:to@my-host.org && rebuild_map'
```

## 3. Manual
```sh
docker exec -it email-forward-container add_mapping hello to@my-host.org
```
