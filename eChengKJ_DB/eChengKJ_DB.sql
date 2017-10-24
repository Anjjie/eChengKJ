--use master
--GO
--IF DB_ID('eChengKJ_DB') IS NOT NULL
--  DROP DATABASE eChengKJ_DB
--GO
-- CREATE DATABASE eChengKJ_DB
-- ON(
--	NAME='eChengKJ_DB',
--	FILENAME='D:\学习资料\南方IT学院二学年学习资料\个人项目\e诚科技\e诚科技网站\eChengKJ\eChengKJ_DB\eChengKJ_DB.MDF'
-- )
 
 GO
USE eChengKJ_DB

--------------【订单表】----------------------------------
GO
IF OBJECT_ID('Order_Table') IS NOT NULL
   DROP TABLE Order_Table
GO
 CREATE TABLE Order_Table
 (
	O_id INT IDENTITY(0,1) PRIMARY KEY, --编号
	P_id INT ,							--产品编号
	U_id INT ,							--购买人编号
	O_LeaveWords NvarChar(200),			--客户留言
	O_DealWay NvarChar(20),				--支付方式
	E_id INT ,							--受理人编号
	O_DateTime Datetime,				--购买时间
	OState_id int,						--订单状态编号
	O_Remark NvarChar(200)				--备注
 ) 
 
--------------【订单状态表】----------------------------------
GO
IF OBJECT_ID('OrderState_Table') IS NOT NULL
   DROP TABLE OrderState_Table
GO
 CREATE TABLE OrderState_Table
 (
	OState_id  int IDENTITY(0,1) PRIMARY KEY,	--订单状态编号
	OState_Name NvarChar(50)					--订单状态名称
 ) 
 
--------------【产品表】----------------------------------
 GO
IF OBJECT_ID('Product_Table') IS NOT NULL
   DROP TABLE Product_Table
GO
 CREATE TABLE Product_Table
 (
	P_id int IDENTITY(0,1) PRIMARY KEY,		--产品编号
	P_No NvarChar(20),						--自定义产品编号
	P_Name NvarChar(100),					--产品名称
	P_Price MONEY,							--产品价格
	PT_id INT DEFAULT(0),					--类型
	HP_id INT DEFAULT(0),					--是否热门
	NP_id INT DEFAULT(1),					--是否新品
	P_Date DateTIME DEFAULT(Convert(datetime,getdate(),120)),--发布日期
	P_Company Nvarchar(200) DEFAULT('e诚科技') ,--出品公司
	E_id INT								--操作人
 )
 
--------------【是否热门产品表】----------------------------------
 GO
IF OBJECT_ID('HotProduct_Table') IS NOT NULL
   DROP TABLE HotProduct_Table
GO
 CREATE TABLE HotProduct_Table
 (
	HP_id int IDENTITY(0,1) PRIMARY KEY,	--热门编号
	HP_Name NvarChar(50),					--是否热门
 )
 
--------------【是否新产品表】----------------------------------
  GO
IF OBJECT_ID('NewProduct_Table') IS NOT NULL
   DROP TABLE NewProduct_Table
GO
 CREATE TABLE NewProduct_Table
 (
	NP_id int IDENTITY(0,1) PRIMARY KEY,--新品编号
	NP_Name NvarChar(50),				--是否新品
 )
 
--------------【产品类型表】----------------------------------
  GO
IF OBJECT_ID('ProductType_Table') IS NOT NULL
   DROP TABLE ProductType_Table
GO
 CREATE TABLE ProductType_Table
 (
	PT_id int IDENTITY(0,1) PRIMARY KEY,--类型编号
	PT_Name NvarChar(50),				--类型名称
 )
 
--------------【产品试用申请表】----------------------------------
  GO
IF OBJECT_ID('ProductTryOur_Table') IS NOT NULL
   DROP TABLE ProductTryOur_Table
GO
 CREATE TABLE ProductTryOur_Table
 (
	PTO_id Int IDENTITY(0,1) primary KEY,  --编号
	PTO_Name NvarChar(50),  --公司名称
	U_id INT ,  --申请人
	PTO_ApplyFor DATE,  --申请日期
	TO_id INT ,	--审核状态
	E_id INT ,  --处理人（操作员）
	PTO_AuditDate Datetime,	--操作时间
	PTO_Activate INT default(0),  --是否激活
	PTO_ExpireDate Datetime,   --到期时间
	PTO_Remark NvarChar(200)  --备注 
 )
 
--------------【试用审核状态表】----------------------------------
  GO
IF OBJECT_ID('TryOut_Table') IS NOT NULL
   DROP TABLE TryOut_Table
GO
 CREATE TABLE TryOut_Table
 (
	TO_id int IDENTITY(0,1) PRIMARY KEY,--状态编号
	TO_Name NvarChar(50),				--状态名称
 )
 
 --------------【用户表】----------------------------------
  GO
IF OBJECT_ID('User_Table') IS NOT NULL
   DROP TABLE User_Table
GO
 CREATE TABLE User_Table
 (
	U_id int IDENTITY(0,1) PRIMARY KEY,		--编号
	U_UserName NVARCHAR(16) ,				--用户名
	U_UserPwd NVARCHAR(16) ,				--密码
	U_Head image ,							--头像
	U_Name NVARCHAR(50) ,					--姓名
	U_Sex NVARCHAR(4) ,						--性别
	IDT_id Int ,							--证件类型
	U_IDS NVARCHAR(18) ,					--证件号码
	U_Phone NVARCHAR(11) ,					--手机号码
	M_id INT ,								--邮箱
	U_Company NVARCHAR(300) ,				--所在公司
	U_ComPanyAddress NVARCHAR(300) ,		--公司地址
	LS_id INT ,								--登录状态
	U_LoginAddress NVARCHAR(300) ,			--登录地址
	U_LoginDatetime DateTime,				--登录时间
	U_LastLoginAddress NVARCHAR(300) ,		--上次登录地址
	U_LastLoginDatetime DateTime ,			--上次登录时间
	U_CreateUserDate DateTime default(getdate())	--创建日期
	
 )
 
 --------------【邮箱表】----------------------------------
  GO
IF OBJECT_ID('Mail_Table') IS NOT NULL
   DROP TABLE Mail_Table
GO
 CREATE TABLE Mail_Table
 (
	M_id int IDENTITY(0,1) PRIMARY KEY,		--编号
	M_Mail NVARCHAR(16) ,					--邮箱号
	M_YesNo NvarChar(4)						--是否激活
 )
 
--------------【登录状态表】----------------------------------
  GO
IF OBJECT_ID('LoginState_Table') IS NOT NULL
   DROP TABLE LoginState_Table
GO
 CREATE TABLE LoginState_Table
 (
	LS_id int IDENTITY(0,1) PRIMARY KEY,		--登录状态编号
	LS_Name NVARCHAR(50) ,					--登录状态名称
 )
 
--------------【证件类型表】----------------------------------
  GO
IF OBJECT_ID('IDType_Table') IS NOT NULL
   DROP TABLE IDType_Table
GO
 CREATE TABLE IDType_Table
 (
	IDT_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	IDT_Name NVARCHAR(50) ,					--证件名称
 )
 
--------------【密保表】----------------------------------
  GO
IF OBJECT_ID('IssueAnswer_Table') IS NOT NULL
   DROP TABLE IssueAnswer_Table
GO
 CREATE TABLE IssueAnswer_Table
 (
	IA_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	U_UserName NVARCHAR(16) ,				--用户账号
	IA_Issue1 NVARCHAR(300) ,				--问题1
	IA_Issue2 NVARCHAR(300) ,				--问题2
	IA_Issue3 NVARCHAR(300) ,				--问题3
	IA_Answer1 NVARCHAR(300) ,				--答案1
	IA_Answer2 NVARCHAR(300) ,				--答案2
	IA_Answer3 NVARCHAR(300) ,				--答案3
 )
 
 --------------【新闻表】----------------------------------
  GO
IF OBJECT_ID('News_Table') IS NOT NULL
   DROP TABLE News_Table
GO
 CREATE TABLE News_Table
 (
	News_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	News_Name NVARCHAR(16) ,				--新闻标题
	News_Content NVARCHAR(300) ,			--新闻内容
	News_Anthor NVARCHAR(300) ,				--新闻作者
	News_Date NVARCHAR(300) 				--发布时间
 )

 --------------【员工表】----------------------------------
  GO
IF OBJECT_ID('Employee_Table') IS NOT NULL
   DROP TABLE Employee_Table
GO
 CREATE TABLE Employee_Table
 (
	E_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	E_UserName NVARCHAR(16) ,			--用户名
	E_UserPwd NVARCHAR(16) ,			--密码
	E_Name NVARCHAR(50) ,				--姓名
	E_Sex NVARCHAR(8), 					--性别
	IDT_id Int, 						--证件类型
	E_IdS NVARCHAR(18), 				--证件号
	E_School NVARCHAR(100), 			--毕业学校
	E_Education NVARCHAR(8), 			--学历
	E_Phone NVARCHAR(11), 				--联系方式
	E_Address NVARCHAR(200),			--家庭住址
	Dep_id INT, 						--部门
	Post_id INT, 						--职位
	E_Pay money,						--薪资
	LS_ID INT, 							--登录状态
	E_LoginAddress NVARCHAR(200), 		--登录地址
	E_LoginDate DATETIME, 				--登录时间
	E_LastLoginAddress NVARCHAR(200), 	--上次登录地址
	E_LastLoginDate DATETIME, 			--上次登录时间
	E_Date DATETIME						--注册时间
 )
  --------------【部门表】----------------------------------
  GO
IF OBJECT_ID('Department_Table') IS NOT NULL
   DROP TABLE Department_Table
GO
 CREATE TABLE Department_Table
 (
	Dep_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	Dep_Name NVARCHAR(50) 					--名称
 )
 
   --------------【职位表】----------------------------------
  GO
IF OBJECT_ID('Post_Table') IS NOT NULL
   DROP TABLE Post_Table
GO
 CREATE TABLE Post_Table
 (
	Post_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	Post_Name NVARCHAR(50) 				--名称
 )

 --------------【招聘表】----------------------------------
  GO
IF OBJECT_ID('JoinUs_Table') IS NOT NULL
   DROP TABLE JoinUs_Table
GO
 CREATE TABLE JoinUs_Table
 (
	JU_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	JU_Name NVARCHAR(50) ,					--用户名
	JU_Sex NVARCHAR(8) ,					--性别
	JU_Phone NVARCHAR(11) ,					--联系方式
	JU_Address NVARCHAR(200), 				--地址
	JUP_id Int, 							--招聘岗位
	JU_SubmitDateTime DateTime 				--提交时间
 )

 --------------【招聘岗位表】----------------------------------
  GO
IF OBJECT_ID('JoinUsPost_Table') IS NOT NULL
   DROP TABLE JoinUsPost_Table
GO
 CREATE TABLE JoinUsPost_Table
 (
	JUP_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	JUP_Name NVARCHAR(50) ,					--岗位名称
	JUP_Number Int							--招聘人数
 )

 --------------【评价表】----------------------------------
  GO
IF OBJECT_ID('Evaluate_Table') IS NOT NULL
   DROP TABLE Evaluate_Table
GO
 CREATE TABLE Evaluate_Table
 (
	Eva_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	U_id Int ,								--用户ID
	P_id Int,								--产品ID
	Eva_Content NVARCHAR(200) ,				--评价内容
	Eva_Datetime DateTime					--时间
 )

 --------------【反馈表】----------------------------------
  GO
IF OBJECT_ID('Feedback_Table') IS NOT NULL
   DROP TABLE Feedback_Table
GO
 CREATE TABLE Feedback_Table
 (
	Feed_id int IDENTITY(0,1) PRIMARY KEY,	--编号
	U_id Int ,								--用户ID
	P_id Int ,								--产品ID
	Feed_Content NVARCHAR(200) ,			--反馈内容
	Feed_Datetime DateTime 					--时间
 )

 --------------【解决方案表】----------------------------------
  GO
IF OBJECT_ID('Solution_Table') IS NOT NULL
   DROP TABLE Solution_Table
GO
 CREATE TABLE Solution_Table
 (
	S_id int IDENTITY(0,1) PRIMARY KEY,		--编号
	P_id INT ,								--产品ID
	S_tatle NVARCHAR(20) ,					--标题
	S_Content NVARCHAR(800) ,				--内容
	S_Datetime DateTime 					--时间
 )

 --------------【公司信息表】----------------------------------
  GO
IF OBJECT_ID('Company_Table') IS NOT NULL
   DROP TABLE Company_Table
GO
 CREATE TABLE Company_Table
 (
	Com_id int IDENTITY(0,1) PRIMARY KEY,		--编号
	Com_Name NVARCHAR(200) ,					--名称
	Com_Logo image ,							--Logo
	Com_Introduce NVARCHAR(200) ,				--介绍
	Com_Honer NVARCHAR(200), 					--荣誉
	Com_Scope NVARCHAR(200),					--销售范围
	Com_Scale NVARCHAR(200), 					--规模
	Com_Course NVARCHAR(200), 					--发展历程
	Com_Purpose NVARCHAR(200) 					--宗旨
 )

 