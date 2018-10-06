# BigTweet2

## Core Versions

| Name | Version |
|:-|:-|
| Ruby | 2.5.1 |
| Rails | 5.2.1 |
| PostgreSQL | 10.0 以上 |

## Required

- AWS S3
    - Access Key
    - Secret Key
    
## Start Application

### env Setting

- S3の設定やdatabase設定など

### Launch Rails Application

```bash
./script/start-application.sh
./script/run-server.sh
```

or

```bash
bundle install --path vendor/bundle
bundle exec rake db:create db:migrate
bundle exec rails -s 0.0.0.0 -b 3000
npm install
```



