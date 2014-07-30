#北大附中学生手册

##作者

- 创意媒体工作室 ： 陈紫晟
- 北京大学附属中学

## 生产环境
- Linux
- Ruby 2.1.2
- Rails 4.1.4
- Postgresql 9.1/9.3
- Puma 2.9.0
- Nginx

## 开发部署：

首先克隆到本地：
    
    git clone https://github.com/cassiuschen/bdfz-guidebook.git

安装Gems：
    
    bundle install

配置数据库：

    rake db:create
    rake db:migrate
    rake db:seed

运行：

    rails s
