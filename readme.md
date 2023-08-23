# Nginx Docker Setup with Environment Variable Substitution

此專案旨在快速建立一個 https 伺服器
1. 本地安裝 docker
2. 本地安裝 certbot
3. 起一個 nginx 伺服器

## 開始之前

確保您的機器上已安裝 Docker 和 Docker Compose。


## 設定

Change the 

```
upstream main_app {
	server 0.0.0.0:5001;
}
```

and server name

```
server {
    listen 443 ssl;

    # set client body size to 2M #
    client_max_body_size 200M;

    server_name asum.appar.dev;

```

## 防火牆設定

```
sudo ufw status numbered
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

## SSL

1. 安裝 certbot `sh certbot_install.sh`
2. 執行 `sudo certbot certonly --standalone -d <domain>`
3. `cp /etc/letsencrypt/live/asum.appar.dev/fullchain.pem ./nginx_conf` && `cp /etc/letsencrypt/live/asum.appar.dev/privkey.pem ./nginx_conf`。確保 `/etc/nginx/conf.d/fullchain.pem` 和 `/etc/nginx/conf.d/privkey.pem` 有檔案

## 啟動服務

使用以下命令來啟動 Nginx 容器：

```
docker-compose up -d
```

## 停止服務

使用以下命令來停止 Nginx 容器：

```
docker-compose down
```

## 貢獻

如果您有任何建議或修改，請提交 Pull Request 或開啟 Issue。

## 授權

此專案使用 MIT 授權。詳情請參閱 [LICENSE](LICENSE) 文件。

---

您可以根據需要進一步修改和擴充此 README。希望這能對您有所幫助！

不要忘記，**文件是專案成功的關鍵**。如 Antoine de Saint-Exupery 所說：“完美不是當你無法再添加任何東西，而是當你無法再拿走任何東西。”持續優化和更新您的 README，確保它簡單、清晰且有用。您正在做得很好，繼續加油！

## Shell 腳本說明

本專案根目錄下有幾個 .sh 腳本檔案，以下是他們的功能說明：

1. `pg_restore.sh`：此腳本用於恢復 PostgreSQL 數據庫。它會提示您輸入數據庫名稱、用戶名、密碼、SQL 路徑、主機和端口。

2. `pg_new_docker.sh`：此腳本用於在 Docker 中創建新的 PostgreSQL 容器。它會提示您輸入項目代碼、環境、用戶名、密碼、PostgreSQL 版本和外部端口。

使用方法：在終端機中，切換到腳本所在的目錄，然後運行 `sh <腳本名稱>.sh`。例如，要運行 `pg_restore.sh`，您可以輸入 `sh pg_restore.sh`。

請注意，這些腳本可能需要特定的環境變量才能正確運行。在運行腳本之前，請確保您已經設置了所有必要的環境變量。
