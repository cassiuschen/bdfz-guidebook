#北大附中学生手册

## 生产环境
- Linux
- Ruby 2.1.0p1
- Rails 4.1.0-beta1
- Postgresql 9.1
- Puma 2.7.1
- Nginx

## 开发部署：

首先克隆到本地：
    
    git clone https://github.com/cassiuschen/bdfz-guidebook

安装Gems：
    
    bundle install

配置数据库：

    rake db:create
    rake db:migrate

运行：

    rails s