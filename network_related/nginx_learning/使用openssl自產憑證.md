# intro

# A. 根憑證 (Root CA)
### 建立根憑證用的私鑰，加上 -des3 幫私鑰加上密碼(PassPhrase)，才不會被拿去亂簽

> openssl genrsa -des3 -out RootCA.key 2048

(這邊會需要輸入私鑰使用的密碼)

### 變更資料可寫安全性(600)
> chmod 600 RootCA.key
(為了安全(?), 讓私鑰檔案只有自己可以讀寫)

### 產生根憑證的申請檔
> openssl req -new -key RootCA.key -out RootCA.req
```log
1 => 輸入剛剛建立私鑰時用的密碼 (password)
2 => 國家簡稱，台灣為 TW (TW)
3 => 州/省，依慣例填 Taiwan (TW)
4 => 城市，台北為 Taipei (TAIPEI)
5 => 組織名稱，請填上公司名稱 (BEST_COMPANY)
6 => 組織單位名稱，這個可以不用填 ()
7 => 一般名稱或公用名稱，如果是申請 Server 用的憑證，這邊要填寫網址，但目前是申請根憑證，不用填 ()
8 => E-mail，就填上負責人的 email 吧 (mailer@best.com)
9 => 不用填 ()
10 => 不用填 ()

```

### 簽發十年有效期根憑證!
> openssl x509 -req -days 3650 -sha256 -extensions v3_ca -signkey RootCA.key -in RootCA.req -out RootCA.crt

### 為了安全(?) 把申請檔砍掉!
> rm -f RootCA.req


# B. Server 憑證 (Server Certificate)
### 建立 Server 憑證用的私鑰
> openssl genrsa -out ServerCert.key 2048


### 產生 Server 憑證的申請檔
> openssl req -new -key ServerCert.key -out ServerCert.req

(這邊與產生根憑證申請檔時一樣要輸入資訊，基本上一樣，但 7 請千萬要填上實際使用的網址!，如果是要申請 Wildcard certificate，那網址請用 * 開頭，像是 *.test.com)


### 產生一組簽發憑證用的流水號檔案 (如果這個檔案已存在，可以不用再產生一次)
> echo 1000 > RootCA.srl


### 用根憑證私鑰簽發三年的 Server 憑證
> openssl x509 -req -days 1095 -sha256 -extensions v3_req -CA RootCA.crt -CAkey RootCA.key -CAserial RootCA.srl -CAcreateserial -in ServerCert.req -out ServerCert.crt



# refer:
- https://www.bear2little.net/wordpress/?p=401