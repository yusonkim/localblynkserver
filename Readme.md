

```bash
# Image Build
docker build -t rasbian-blynk:kim.01 .

# Run
docker run -d --rm --name blynk -p 8080:8080 -p 9443:9443 -v /home/pi/blynk/data:/data rasbian-blynk:kim.01
```

## 自動起動
`/etc/systemd/system/blynk.service`の中に記述し、systemdでコントロール

```bash
$ vim blynk.service

[Unit]
Description=BlynkServer
After=syslog.target

[Service]
Type=simple
WorkingDirectory=/home/pi
ExecStart=docker run -d --rm --name blynk -p 8080:8080 -p 9443:9443 linuxkonsult/rasbian-blynk
TimeoutStopSec=10
StandardOutput=null

[Install]
WantedBy = multi-user.target
```

```bash
$ sudo mv blynk.service /etc/systemd/system/
$ sudo systemctl daemon-reload  # 読み込み
$ sudo systemctl enable blynk   # 自動起動設定

$ sudo systemctl disable blynk  # 自動起動停止
$ sudo systemctl start blynk    # 手動スタート
$ sudo systemctl stop blynk     # 手動停止
$ sudo systemctl status blynk       # 状態確認
```# localblynkserver
# localblynkserver
# localblynkserver
