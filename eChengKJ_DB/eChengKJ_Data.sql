USE eChengKJ_DB

/*
	为保证数据的有效性与维护的方便性，将固定的数据优先添加
*/



----------【订单状态】---------------------
--EXEC Insert_OrderStateTable '未完成' 
--EXEC Insert_OrderStateTable '已完成'
--EXEC Insert_OrderStateTable '正在处理'

--EXEC Select_OrderStateTable

----------【是否热门产品表】---------------------
--EXEC Insert_HotProductTable '是'
--EXEC Insert_HotProductTable '否'

--EXEC Select_HotProductTable

----------【是否新产品表】---------------------
--EXEC Insert_NewProductTable '是'
--EXEC Insert_NewProductTable '否'

--EXEC Select_NewProductTable

----------【产品类型表】---------------------
--EXEC Insert_ProductTypeTable '电子商务'
--EXEC Insert_ProductTypeTable '服装'
--EXEC Insert_ProductTypeTable '工厂'
--EXEC Insert_ProductTypeTable '酒店'
--EXEC Insert_ProductTypeTable '公司'

--EXEC Select_ProductTypeTable

----------【试用审核状态表】---------------------
--EXEC Insert_TryOutTable '未审核'
--EXEC Insert_TryOutTable '未通过'
--EXEC Insert_TryOutTable '通过'
--EXEC Insert_TryOutTable '正在审核'

--EXEC Select_TryOutTable

----------【登录状态表】---------------------
--EXEC Insert_LoginStateTable '未登陆'
--EXEC Insert_LoginStateTable '正在登陆'

--EXEC Select_LoginStateTable

----------【证件类型表】---------------------
--EXEC Insert_IDTypeTable '身份证'
--EXEC Insert_IDTypeTable '护照'

--EXEC Select_IDTypeTable

----------【部门表】---------------------
--EXEC Insert_DepartmentTable '高级管理'
--EXEC Insert_DepartmentTable '技术部'
--EXEC Insert_DepartmentTable '业务部'
--EXEC Insert_DepartmentTable '人事部'
--EXEC Insert_DepartmentTable '财政部'

--EXEC Select_DepartmentTable

----------【职位表】---------------------
--EXEC Insert_PostTable '董事长'
--EXEC Insert_PostTable '董事'
--EXEC Insert_PostTable '总经理'
--EXEC Insert_PostTable '经理'
--EXEC Insert_PostTable '总监'
--EXEC Insert_PostTable '主管'
--EXEC Insert_PostTable '员工'

--EXEC Select_PostTable


------------【用户表】---------------------
--用户名、密码、头像、姓名、性别、证件类型、证件号、手机号码、邮箱、所在公司、公司地址、登录状态、登录地址、登录时间、上次登录时间、上次登录地点、创建日期

Insert into User_Table
values('User01','User01','Logo_ICO.png','顾安萱','女','0','341000199101296948','12345678901','','e诚科技','广东珠海南方科技路123号','0','','','','',default)

Insert into User_Table
values('User02','User02','Logo_ICO.png','储曼梅','女','0','341000199101296948','12345678901','','e诚科技','广东珠海南方科技路123号','0','','','','',default)

Insert into User_Table
values('User03','User03','Logo_ICO.png','贺瑶一','男','0','341000199101296948','12345678901','','e诚科技','广东珠海南方科技路123号','0','','','','',default)

EXEC Select_UserTable

------------【员工表】---------------------
--用户名、密码、姓名、性别、证件类型、证件号、毕业学校、学历、联系方式、家庭住址、部门、职位、工资、登录状态、登录地址、登录时间、上次登录时间、上次登录地点、注册时间
Insert into Employee_Table
values('Admin1','Admin1','云新锁','男','0','440705198011202491','暨南大学','本科','12345678901','广东珠海香洲香楠路123号','3','6','4000','0','','','','',CONVERT(datetime, GETDATE(),120))

Insert into Employee_Table
values('Admin2','Admin2','汪圣熙','男','0','350924198906261917','暨南大学','专科','12345678901','广东珠海香洲香楠路124号','2','6','4000','0','','','','',CONVERT(datetime, GETDATE(),120))

Insert into Employee_Table
values('Admin3','Admin3','毕书蝶','女','0','34022219860802956X','暨南大学','本科','12345678901','广东珠海香洲香楠路125号','1','6','5000','0','','','','',CONVERT(datetime, GETDATE(),120))

EXEC Select_EmployeeTable

EXEC Select_DepartmentTable
EXEC Select_PostTable

------------【产品表】---------------------
--名称、价格、产品类型、是否热门产品、是否新产品、发布日期、出品公司、录入人员
Insert into Product_Table
values('00000001','e购天下','8888','0',default,default,default,default,1)

Insert into Product_Table
values('10000001','e服智管','9999','1',default,default,default,default,1)

Insert into Product_Table
values('40000001','This资源','11111','4',default,default,default,default,1)

EXEC Select_ProductTable
EXEC Select_ProductTypeTable



------------【e诚科技信息表】---------------------
--公司名称、公司Logo、公司介绍、公司荣誉、公司范围介绍、公司规模、公司发展历程、公司宗旨
Insert into Company_Table
values('e诚科技','','e诚科技，2017新创一所潜力无限的黑马科技公司，专门服务企业资源管理。',
'','各行各业ERP系统','2017年人数为1人','2017年创办','创新驱动发展，质量要第一，效率也要第一。')

EXEC Select_CompanyTable







