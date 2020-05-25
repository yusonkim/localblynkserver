APP_ROOT=`pwd`
WORK_DIR=`pwd | xargs dirname`
IMAGE_NAME=rasbian-blynk:customlocal

# 自動起動 ファイルの作成と配置
sudo echo "[Unit]
Description=BlynkServer
After=syslog.target

[Service]
Type=simple
WorkingDirectory=${WORK_DIR}
ExecStart=/usr/bin/docker run -d --rm --name blynk -p 8080:8080 -p 9443:9443 -v ${APP_ROOT}/data:/data ${IMAGE_NAME}
TimeoutStopSec=30
StandardOutput=null

[Install]
WantedBy = multi-user.target
" > /etc/systemd/system/blynk.service

# ファイルのロードと有効化
$ sudo systemctl daemon-reload  # 読み込み
$ sudo systemctl enable blynk   # 自動起動設定