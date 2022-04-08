测试流程：

需求评审

详细设计

showcase

本地测试

准出

预上线

线上

小流量上线

加名单



分支开发

拉开发分支，及时同步主干，避免上线时要解决的冲突过多

合master之前写拉主干代码，然后解决完冲突合回主干，

主干上线



联调

caselist

测试方案

负责 CI 自动部署 流水线

搭环境



itp

前端自动化



linux 命令：

每天登陆容器、实例，查看日志

ssh --matrix work@容器名

tail -vf *.log 查看日志的命令

通过requestid查找日志，grep "requestid" *  -C10

python debug

import pdb

pdb.set_trace()



case study



---

[stargate interface check tools] Java maven 

stargate check rules

1. enum、interface、class
   1. the variable can't be deleted
   2. new variable only can be added at last

I developed stargate interface check tool by springboot framework which can check code is fit particular rule or not, after stable running a while later and geting praise.To promtion this check tool, so I combined it with agile tool. when run commit record python shell which is a step of agile tools, the stargate check shell will be invoke, and the check shell script will invoke the main java stargate check tools.

During developing these tools I searched some methods to download code which need to be checked, I selected Jgit because it could keep information of git which will help me to make diff depends on commits. After that checking code is fit stargate interface rule or not by traversing every changed file. If there are some wrong, it will be send a email to notice.

---

[Api_client_tool]  python

to test the send json content is right or not, I developed a cilent tool to recevied all the detail of http post request, including content-type, header, request.data etc.

