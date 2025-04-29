## Установка Wiki.js
1. Устанавливаем Docker
```bash
sudo -i
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli docker-compose
systemctl enable docker --now
systemctl start docker
```
2. Создаем необходимые каталоги и файлы
```bash
sudo -i
groupadd --system wiki
useradd -s /sbin/nologin --system -m -g wiki wiki
usermod -a -G docker wiki
mkdir -p /opt/wiki
mkdir -p /home/wiki/backup
mkdir -p /home/wiki/pgdata
mkdir -p /home/wiki/wikidata
chown -R wiki:wiki /home/wiki
chmod -R 755 /opt/wiki
chmod -R 755 /home/wiki/backup
chmod -R 755 /home/wiki/pgdata
chmod -R 755 /home/wiki/wikidata
ln -s /home/wiki/backup /opt/wiki/backup
ln -s /home/wiki/pgdata /opt/wiki/pgdata
ln -s /home/wiki/wikidata /opt/wiki/wikidata
touch /opt/wiki/wiki-compose.yaml
chmod 640 /opt/wiki/wiki-compose.yaml
touch /opt/wiki/wiki-config.yaml
chmod 640 /opt/wiki/wiki-config.yaml
touch /opt/wiki/ru.yaml
chmod 640 /opt/wiki/ru.yaml
touch /opt/wiki/start.sh
chmod 750 /opt/wiki/start.sh
touch /opt/wiki/stop.sh
chmod 750 /opt/wiki/stop.sh
touch /opt/wiki/upgrade.sh
chmod 750 /opt/wiki/upgrade.sh
touch /opt/wiki/fix-data
chmod 750 /opt/wiki/fix-data
touch /opt/wiki/ifcmtechwiki.service
chmod 644 /opt/wiki/ifcmtechwiki.service
chown -R wiki:wiki /opt/wiki
```