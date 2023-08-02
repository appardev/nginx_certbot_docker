# Nginx Docker Setup with Environment Variable Substitution

此專案使用 Docker 和 Nginx 來建立一個支援環境變數替換的網頁伺服器。

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