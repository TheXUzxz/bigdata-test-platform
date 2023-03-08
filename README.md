## 使用步骤

1. `git clone http://git.thexu.cn/bigdata/testingcluster_bigdata_ansible.git`
2. 下载 `https://pan.baidu.com/s/1mgRjKaxqVBFstB0F6QDz5A`, 在项目根目录下创建目录 `pkgs`, 并将下载的文件放入 `pkgs` 目录
3. 自行下载 `Vagrant`, `VirtualBox` 最新版, 安装
4. 安装 `Vagrant` 插件 `diskresize`, 使用命令 `vagrant plugin install vagrant-disksize`
5. 进入项目目录执行 `vagrant up`
6. 配置 `hosts` 文件, 如下方所示
7. 等待 `35` 分钟左右, 打开 `master01:7180` 查看集群, 所有账号密码均为默认 `admin`

```text
192.168.56.101 master01
192.168.56.102 worker01
192.168.56.103 worker02
```

## 功能

1. 自动创建 VirtualBox 虚拟机, 包括双网卡配置, IP 地址在 Vagrant 文件中配置
2. 自动创建 CentOS 环境, 包括防火墙配置, SELinux, EPEL, MySQL Connector, MariaDB, JDK, 句柄, 时间同步, 依赖安装
3. 自动创建本地 Yum 仓库, 已包含所有脚本需要的 RPM (存疑)
4. 自动配置所有虚拟机的 hosts
5. 自动在所有节点安装 SCM Agents, 包含 SCM 的配置
6. 自动安装 SCM Server
7. 自动创建 Cloudera Management (为保障集群资源, 已注释)
8. 自动安装 CDH 集群, 使用 SCM API Version 37, 如需使用 Hook, 请查阅文档 master01:7180/static/apidocs/ui/index.html#/

## 包含服务

* HBase
* HDFS
* Hive
* Hue
* Oozie
* Solr
* Spark 2
* YARN
* Zookeeper

如需添加更多服务, 请自行添加, 或者以 Issus 的方式提出

## 配置项

所有配置项均在 playbooks/group_vars/all.yml

(文档待完善)

## 未来计划

现在的版本还有诸多不完善, 因为是工作之余创建, 所以第一要务还是修缮 Bug, 有如下需要做的工作

* 一部分配置项还不完善, 请协助完善, 需要技能: 熟悉 SCM API, 熟悉 Jinja2 脚本语法
* 还无法做到完全本地安装, 一部分服务还需要联网, 需要技能: 熟悉 Yum 本地仓库, Yum 仓库机制

未来还有一些计划, 需要大家协助设计

* 创建 Web server, 自动化生成 Vagrant 配置
* 自动化生成 Ansible playbooks 的配置
* 实现 Web 化数据生成, 并整合此项目

最终目标

* 以一个随地可部署的 Web 项目的方式, 自动化创建一整个数据测试平台, 大致如下步骤
    1. 选择模板
    2. 选择数据集
    3. 自动化生成脚本下载
    4. 运行脚本创建集群, 包含测试数据, 集群自动化部署
