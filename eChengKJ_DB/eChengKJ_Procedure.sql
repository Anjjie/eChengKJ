USE eChengKJ_DB

GO

--=============================【建立存储过程】==================================--

-----------------------------------参考格式--------------------------------
--IF Exists(SELECT * FROM sys.procedures WHERE name='[操作类型]_[表明]_[条件列名]')
--	drop proc [操作类型]_[表明]_[条件列名]
--GO
--	Create proc [操作类型]_[表明]_[条件列名] 
--	AS
--	[执行语句]

----------------------------------------------------------------------------

/*
	说明：本SQL文档存储过程创建的是简单的增删查改，
	更复杂的或者后续操作的则用另一个【SQL文件】编写
*/

go

--【订单表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_OrderTable')
	DROP PROC Select_OrderTable
GO
	CREATE PROC Select_OrderTable
	AS
	SELECT * FROM Order_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_OrderTable')
	DROP PROC Insert_OrderTable
GO
	CREATE PROC Insert_OrderTable
	@P_id INT ,							--产品编号
	@U_id INT ,							--购买人编号
	@O_LeaveWords NvarChar(200),		--客户留言
	@O_DealWay NvarChar(20),			--支付方式
	@E_id INT ,							--受理人编号
	@O_DateTime Datetime,				--购买时间
	@OState_id int,						--订单状态编号
	@O_Remark NvarChar(200)				--备注
	AS
	Insert INTO  Order_Table
	VALUES(@P_id,@U_id,@O_LeaveWords,@O_DealWay,@E_id,@O_DateTime,@OState_id,@O_Remark)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_OrderTable')
	DROP PROC Update_OrderTable
GO
	CREATE PROC Update_OrderTable
	@O_id int,							--订单编号
	@P_id INT ,							--产品编号
	@U_id INT ,							--购买人编号
	@O_LeaveWords NvarChar(200),		--客户留言
	@O_DealWay NvarChar(20),			--支付方式
	@E_id INT ,							--受理人编号
	@O_DateTime Datetime,				--购买时间
	@OState_id int,						--订单状态编号
	@O_Remark NvarChar(200)				--备注
	AS
	Update  Order_Table set P_id=@P_id,U_id=@U_id,O_LeaveWords=@O_LeaveWords,
	O_DealWay=@O_DealWay,E_id=@E_id,O_DateTime=@O_DateTime,OState_id=@OState_id,O_Remark=@O_Remark 
	where O_id=@O_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_OrderTable')
	DROP PROC Delete_OrderTable
GO
	CREATE PROC Delete_OrderTable
	@O_id int							--订单编号
	AS
	DELETE FROM  Order_Table where O_id=@O_id
GO





--【订单状态表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_OrderStateTable')
	DROP PROC Select_OrderStateTable
GO
	CREATE PROC Select_OrderStateTable
	AS
	SELECT * FROM OrderState_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_OrderStateTable')
	DROP PROC Insert_OrderStateTable
GO
	CREATE PROC Insert_OrderStateTable
	@OState_Name NvarChar(50)			--订单状态名称
	AS
	Insert INTO  OrderState_Table
	VALUES(@OState_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_OrderStateTable')
	DROP PROC Update_OrderStateTable
GO
	CREATE PROC Update_OrderStateTable
	@OState_id int,							--订单状态编号
	@OState_Name NvarChar(50)			--订单状态名称
	AS
	Update  OrderState_Table set OState_Name=@OState_Name where OState_id=@OState_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_OrderStateTable')
	DROP PROC Delete_OrderStateTable
GO
	CREATE PROC Delete_OrderStateTable
	@OState_id int								--订单状态编号
	AS
	DELETE FROM  OrderState_Table where OState_id=@OState_id
GO




--【产品表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_ProductTable')
	DROP PROC Select_ProductTable
GO
	CREATE PROC Select_ProductTable
	AS
	SELECT * FROM Product_Table									
	
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_ProductTable')
	DROP PROC Insert_ProductTable
GO
	CREATE PROC Insert_ProductTable
	@P_No NvarChar(20),						--自定义产品编号
	@P_Name NvarChar(100),					--产品名称
	@P_Price MONEY,							--产品价格
	@PT_id INT,								--类型
	@HP_id INT ,							--是否热门
	@NP_id INT,								--是否新品
	@P_Date DateTIME,						--发布日期
	@P_Company Nvarchar(200)='e诚科技' ,	--出品公司
	@E_id INT								--操作人
	AS
	Insert INTO  Product_Table
	VALUES(@P_No,@P_Name,@P_Price,@PT_id,@HP_id,@NP_id,@P_Date,@P_Company,@E_id)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_ProductTable')
	DROP PROC Update_ProductTable
GO
	CREATE PROC Update_ProductTable
	@P_id int,								--产品编号
	@P_No NvarChar(20),						--自定义产品编号
	@P_Name NvarChar(100),					--产品名称
	@P_Price MONEY,							--产品价格
	@PT_id INT,								--类型
	@HP_id INT ,							--是否热门
	@NP_id INT,								--是否新品
	@P_Date DateTIME,						--发布日期
	@P_Company Nvarchar(200)='e诚科技' ,	--出品公司
	@E_id INT								--操作人
	AS
	Update  Product_Table set P_No=@P_No,P_Name=@P_Name,P_Price=@P_Price,PT_id =@PT_id,
	HP_id=@HP_id,NP_id=@NP_id,P_Date=@P_Date,P_Company=@P_Company,E_id=@E_id where P_id=@P_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_ProductTable')
	DROP PROC Delete_ProductTable
GO
	CREATE PROC Delete_ProductTable
	@P_id int									--产品编号
	AS
	DELETE FROM  Product_Table where P_id=@P_id
GO



--【是否热门产品表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_HotProductTable')
	DROP PROC Select_HotProductTable
GO
	CREATE PROC Select_HotProductTable
	AS
	SELECT * FROM HotProduct_Table									
	
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_HotProductTable')
	DROP PROC Insert_HotProductTable
GO
	CREATE PROC Insert_HotProductTable
	@HP_Name NvarChar(50)					--是否热门
	AS
	Insert INTO  HotProduct_Table
	VALUES(@HP_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_HotProductTable')
	DROP PROC Update_HotProductTable
GO
	CREATE PROC Update_HotProductTable
	@HP_id int,								--热门编号
	@HP_Name NvarChar(50)					--是否热门
	AS
	Update  HotProduct_Table set HP_Name=@HP_Name where HP_id=@HP_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_HotProductTable')
	DROP PROC Delete_HotProductTable
GO
	CREATE PROC Delete_HotProductTable
	@HP_id int								--热门编号
	AS
	DELETE FROM  HotProduct_Table where HP_id=@HP_id
GO




--【是否新产品表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_NewProductTable')
	DROP PROC Select_NewProductTable
GO
	CREATE PROC Select_NewProductTable
	AS
	SELECT * FROM NewProduct_Table									

	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_NewProductTable')
	DROP PROC Insert_NewProductTable
GO
	CREATE PROC Insert_NewProductTable
	@NP_Name NvarChar(50)					--是否新产品
	AS
	Insert INTO  NewProduct_Table
	VALUES(@NP_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_NewProductTable')
	DROP PROC Update_NewProductTable
GO
	CREATE PROC Update_NewProductTable
	@NP_id int,								--新产品编号
	@NP_Name NvarChar(50)					--是否新产品
	AS
	Update  NewProduct_Table set NP_Name=@NP_Name where NP_id=@NP_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_NewProductTable')
	DROP PROC Delete_NewProductTable
GO
	CREATE PROC Delete_NewProductTable
	@NP_id int								--新产品编号
	AS
	DELETE FROM  NewProduct_Table where NP_id=@NP_id
GO



--【产品类型表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_ProductTypeTable')
	DROP PROC Select_ProductTypeTable
GO
	CREATE PROC Select_ProductTypeTable
	AS
	SELECT * FROM ProductType_Table									
	
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_ProductTypeTable')
	DROP PROC Insert_ProductTypeTable
GO
	CREATE PROC Insert_ProductTypeTable
	@PT_Name NvarChar(50)					--产品类型名称
	AS
	Insert INTO  ProductType_Table
	VALUES(@PT_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_ProductTypeTable')
	DROP PROC Update_ProductTypeTable
GO
	CREATE PROC Update_ProductTypeTable
	@PT_id int,								--编号
	@PT_Name NvarChar(50)					--产品类型名称
	AS
	Update  ProductType_Table set PT_Name=@PT_Name where PT_id=@PT_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_ProductTypeTable')
	DROP PROC Delete_ProductTypeTable
GO
	CREATE PROC Delete_ProductTypeTable
	@PT_id int								--编号
	AS
	DELETE FROM  ProductType_Table where PT_id=@PT_id
GO



--【产品试用申请表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_ProductTryOurTable')
	DROP PROC Select_ProductTryOurTable
GO
	CREATE PROC Select_ProductTryOurTable
	AS
	SELECT * FROM ProductTryOur_Table									
	
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_ProductTryOurTable')
	DROP PROC Insert_ProductTryOurTable
GO
	CREATE PROC Insert_ProductTryOurTable
	@PTO_Name NvarChar(50),  --公司名称
	@U_id INT ,  --申请人
	@PTO_ApplyFor DATE,  --申请日期
	@TO_id INT ,	--审核状态
	@E_id INT ,  --处理人（操作员）
	@PTO_AuditDate Datetime,	--操作时间
	@PTO_Activate INT ,  --是否激活
	@PTO_ExpireDate Datetime,   --到期时间
	@PTO_Remark NvarChar(200)  --备注 
	AS
	Insert INTO  ProductTryOur_Table
	VALUES(@PTO_Name,@U_id,@PTO_ApplyFor,@TO_id,@E_id,@PTO_AuditDate,@PTO_Activate,@PTO_ExpireDate,
	@PTO_Remark)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_ProductTryOurTable')
	DROP PROC Update_ProductTryOurTable
GO
	CREATE PROC Update_ProductTryOurTable
	@PTO_id Int ,  --编号
	@PTO_Name NvarChar(50),  --公司名称
	@U_id INT ,  --申请人
	@PTO_ApplyFor DATE,  --申请日期
	@TO_id INT ,	--审核状态
	@E_id INT ,  --处理人（操作员）
	@PTO_AuditDate Datetime,	--操作时间
	@PTO_Activate INT ,  --是否激活
	@PTO_ExpireDate Datetime,   --到期时间
	@PTO_Remark NvarChar(200)  --备注 
	AS
	Update  ProductTryOur_Table set PTO_Name=@PTO_Name,U_id=@U_id,PTO_ApplyFor=@PTO_ApplyFor,
	TO_id=@TO_id,E_id=@E_id,PTO_AuditDate=@PTO_AuditDate,PTO_Activate=@PTO_Activate,
	PTO_ExpireDate=@PTO_ExpireDate,PTO_Remark=@PTO_Remark
	 where PTO_id=@PTO_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_ProductTryOurTable')
	DROP PROC Delete_ProductTryOurTable
GO
	CREATE PROC Delete_ProductTryOurTable
	@PTO_id Int   --编号
	AS
	DELETE FROM  ProductTryOur_Table where PTO_id=@PTO_id
GO





--【试用审核状态表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_TryOutTable')
	DROP PROC Select_TryOutTable
GO
	CREATE PROC Select_TryOutTable
	AS
	SELECT * FROM TryOut_Table									
	
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_TryOutTable')
	DROP PROC Insert_TryOutTable
GO
	CREATE PROC Insert_TryOutTable
	@TO_Name NvarChar(50)				--状态名称
	AS
	Insert INTO  TryOut_Table
	VALUES(@TO_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_TryOutTable')
	DROP PROC Update_TryOutTable
GO
	CREATE PROC Update_TryOutTable
	@TO_id int,							--状态编号
	@TO_Name NvarChar(50)				--状态名称
	AS
	Update  TryOut_Table set TO_Name=@TO_Name where TO_id=@TO_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_TryOutTable')
	DROP PROC Delete_TryOutTable
GO
	CREATE PROC Delete_TryOutTable
	@TO_id int							--状态编号
	AS
	DELETE FROM  TryOut_Table where TO_id=@TO_id
GO



--【用户表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_UserTable')
	DROP PROC Select_UserTable
GO
	CREATE PROC Select_UserTable
	AS
	SELECT * FROM User_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_UserTable')
	DROP PROC Insert_UserTable
GO
	CREATE PROC Insert_UserTable
	@U_UserName NVARCHAR(16) ,				--用户名
	@U_UserPwd NVARCHAR(16) ,				--密码
	@U_Head NVARCHAR(300) ,					--头像
	@U_Name NVARCHAR(50) ,					--姓名
	@U_Sex NVARCHAR(4) ,					--性别
	@IDT_id Int ,							--证件类型
	@U_IDS NVARCHAR(18) ,					--证件号码
	@U_Phone NVARCHAR(11) ,					--手机号码
	@M_id INT ,								--邮箱
	@U_Company NVARCHAR(300) ,				--所在公司
	@U_ComPanyAddress NVARCHAR(300) ,		--公司地址
	@U_PhoneVerify NVARCHAR(5),				--手机验证码（动态）
	@LS_id INT ,							--登录状态
	@U_LoginAddress NVARCHAR(300) ,			--登录地址
	@U_LoginDatetime DateTime,				--登录时间
	@U_LastLoginAddress NVARCHAR(300) ,		--上次登录地址
	@U_LastLoginDatetime DateTime ,			--上次登录时间
	@U_CreateUserDate DateTime				--创建日期
	AS
	Insert INTO  User_Table
	VALUES(@U_UserName,@U_UserPwd,@U_Head,@U_Name,@U_Sex,@IDT_id,@U_IDS,@U_Phone,@M_id,@U_Company,
	@U_ComPanyAddress,@U_PhoneVerify,@LS_id,@U_LoginAddress,@U_LoginDatetime,@U_LastLoginAddress,@U_LastLoginDatetime,@U_CreateUserDate)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_UserTable')
	DROP PROC Update_UserTable
GO
	CREATE PROC Update_UserTable
	@U_id int ,								--编号
	@U_UserName NVARCHAR(16) ,				--用户名
	@U_UserPwd NVARCHAR(16) ,				--密码
	@U_Head NVARCHAR(300) ,					--头像
	@U_Name NVARCHAR(50) ,					--姓名
	@U_Sex NVARCHAR(4) ,					--性别
	@IDT_id Int ,							--证件类型
	@U_IDS NVARCHAR(18) ,					--证件号码
	@U_Phone NVARCHAR(11) ,					--手机号码
	@M_id INT ,								--邮箱
	@U_Company NVARCHAR(300) ,				--所在公司
	@U_ComPanyAddress NVARCHAR(300) ,		--公司地址
	@U_PhoneVerify NVARCHAR(5),				--手机验证码（动态）
	@LS_id INT ,							--登录状态
	@U_LoginAddress NVARCHAR(300) ,			--登录地址
	@U_LoginDatetime DateTime,				--登录时间
	@U_LastLoginAddress NVARCHAR(300) ,		--上次登录地址
	@U_LastLoginDatetime DateTime ,			--上次登录时间
	@U_CreateUserDate DateTime 				--创建日期
	AS
	Update  User_Table set U_UserName=@U_UserName,U_UserPwd=@U_UserPwd,U_Head=@U_Head,U_Name=@U_Name,
	U_Sex=@U_Sex,IDT_id=@IDT_id,U_IDS=@U_IDS,U_Phone=@U_Phone,M_id=@M_id,U_Company=@U_Company,
	U_ComPanyAddress=@U_ComPanyAddress,U_PhoneVerify=@U_PhoneVerify,
	LS_id=@LS_id,U_LoginAddress=@U_LoginAddress,
	U_LoginDatetime=@U_LoginDatetime,U_LastLoginAddress=@U_LastLoginAddress,
	U_LastLoginDatetime=@U_LastLoginDatetime,U_CreateUserDate=@U_CreateUserDate
	 where U_id=@U_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_UserTable')
	DROP PROC Delete_UserTable
GO
	CREATE PROC Delete_UserTable
	@U_id int 								--编号
	AS
	DELETE FROM  User_Table where U_id=@U_id
GO




--【邮箱表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_MailTable')
	DROP PROC Select_MailTable
GO
	CREATE PROC Select_MailTable
	AS
	SELECT * FROM Mail_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_MailTable')
	DROP PROC Insert_MailTable
GO
	CREATE PROC Insert_MailTable
	@M_Mail NVARCHAR(16) ,					--邮箱号
	@M_YesNo NvarChar(4)					--是否激活
	AS
	Insert INTO  Mail_Table
	VALUES(@M_Mail,@M_YesNo)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_MailTable')
	DROP PROC Update_MailTable
GO
	CREATE PROC Update_MailTable
	@M_id int ,								--编号
	@M_Mail NVARCHAR(16) ,					--邮箱号
	@M_YesNo NvarChar(4)					--是否激活
	AS
	Update  Mail_Table set M_Mail=@M_Mail,M_YesNo=@M_YesNo
	 where M_id=@M_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_MailTable')
	DROP PROC Delete_MailTable
GO
	CREATE PROC Delete_MailTable
	@M_id int 								--编号
	AS
	DELETE FROM  Mail_Table  where M_id=@M_id
GO




--【登录状态表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_LoginStateTable')
	DROP PROC Select_LoginStateTable
GO
	CREATE PROC Select_LoginStateTable
	AS
	SELECT * FROM LoginState_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_LoginStateTable')
	DROP PROC Insert_LoginStateTable
GO
	CREATE PROC Insert_LoginStateTable
	@LS_Name NVARCHAR(50) 					--登录状态名称
	AS
	Insert INTO  LoginState_Table
	VALUES(@LS_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_LoginStateTable')
	DROP PROC Update_LoginStateTable
GO
	CREATE PROC Update_LoginStateTable
	@LS_id int ,							--登录状态编号
	@LS_Name NVARCHAR(50)					--登录状态名称
	AS
	Update  LoginState_Table set LS_Name=@LS_Name
	 where LS_id=@LS_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_LoginStateTable')
	DROP PROC Delete_LoginStateTable
GO
	CREATE PROC Delete_LoginStateTable
	@LS_id int 								--编号
	AS
	DELETE FROM  LoginState_Table   where LS_id=@LS_id
GO





--【证件类型表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_IDTypeTable')
	DROP PROC Select_IDTypeTable
GO
	CREATE PROC Select_IDTypeTable
	AS
	SELECT * FROM IDType_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_IDTypeTable')
	DROP PROC Insert_IDTypeTable
GO
	CREATE PROC Insert_IDTypeTable
	@IDT_Name NVARCHAR(50) 					--证件名称
	AS
	Insert INTO  IDType_Table
	VALUES(@IDT_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_IDTypeTable')
	DROP PROC Update_IDTypeTable
GO
	CREATE PROC Update_IDTypeTable
	@IDT_id int ,	--编号
	@IDT_Name NVARCHAR(50) 					--证件名称
	AS
	Update  IDType_Table set IDT_Name=@IDT_Name
	 where IDT_id=@IDT_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_IDTypeTable')
	DROP PROC Delete_IDTypeTable
GO
	CREATE PROC Delete_IDTypeTable
	@IDT_id int 								--编号
	AS
	DELETE FROM  IDType_Table    where IDT_id=@IDT_id
GO



--【密保表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_IssueAnswerTable')
	DROP PROC Select_IssueAnswerTable
GO
	CREATE PROC Select_IssueAnswerTable
	AS
	SELECT * FROM IssueAnswer_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_IssueAnswerTable')
	DROP PROC Insert_IssueAnswerTable
GO
	CREATE PROC Insert_IssueAnswerTable
	@U_UserName NVARCHAR(16) ,				--用户账号
	@IA_Issue1 NVARCHAR(300) ,				--问题1
	@IA_Issue2 NVARCHAR(300) ,				--问题2
	@IA_Issue3 NVARCHAR(300) ,				--问题3
	@IA_Answer1 NVARCHAR(300) ,				--答案1
	@IA_Answer2 NVARCHAR(300) ,				--答案2
	@IA_Answer3 NVARCHAR(300) 				--答案3
	AS
	Insert INTO  IssueAnswer_Table
	VALUES(@U_UserName,@IA_Issue1,@IA_Issue2,@IA_Issue3,@IA_Answer1,@IA_Answer2,@IA_Answer3)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_IssueAnswerTable')
	DROP PROC Update_IssueAnswerTable
GO
	CREATE PROC Update_IssueAnswerTable
	@IA_id int ,	--编号
	@U_UserName NVARCHAR(16) ,				--用户账号
	@IA_Issue1 NVARCHAR(300) ,				--问题1
	@IA_Issue2 NVARCHAR(300) ,				--问题2
	@IA_Issue3 NVARCHAR(300) ,				--问题3
	@IA_Answer1 NVARCHAR(300) ,				--答案1
	@IA_Answer2 NVARCHAR(300) ,				--答案2
	@IA_Answer3 NVARCHAR(300) 				--答案3
	AS
	Update  IssueAnswer_Table set U_UserName=@U_UserName,IA_Issue1=@IA_Issue1,IA_Issue2=@IA_Issue2,
	IA_Issue3=@IA_Issue3,IA_Answer1=@IA_Answer1,IA_Answer2=@IA_Answer2,IA_Answer3=@IA_Answer3
	where IA_id=@IA_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_IssueAnswerTable')
	DROP PROC Delete_IssueAnswerTable
GO
	CREATE PROC Delete_IssueAnswerTable
	@IA_id int 								--编号
	AS
	DELETE FROM  IssueAnswer_Table    where IA_id=@IA_id
GO




--【新闻表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_NewsTable')
	DROP PROC Select_NewsTable
GO
	CREATE PROC Select_NewsTable
	AS
	SELECT * FROM News_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_NewsTable')
	DROP PROC Insert_NewsTable
GO
	CREATE PROC Insert_NewsTable
	@News_Name NVARCHAR(16) ,				--新闻标题
	@News_Content NVARCHAR(300) ,			--新闻内容
	@News_Anthor NVARCHAR(300) ,				--新闻作者
	@News_Date NVARCHAR(300) 				--发布时间
	AS
	Insert INTO  News_Table
	VALUES(@News_Name,@News_Content,@News_Anthor,@News_Date)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_NewsTable')
	DROP PROC Update_NewsTable
GO
	CREATE PROC Update_NewsTable
	@News_id int ,							--编号
	@News_Name NVARCHAR(16) ,				--新闻标题
	@News_Content NVARCHAR(300) ,			--新闻内容
	@News_Anthor NVARCHAR(300) ,				--新闻作者
	@News_Date NVARCHAR(300) 				--发布时间
	AS
	Update  News_Table set News_Name=@News_Name,News_Content=@News_Content,News_Anthor=@News_Anthor,
	News_Date=@News_Date
	where News_id=@News_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_NewsTable')
	DROP PROC Delete_NewsTable
GO
	CREATE PROC Delete_NewsTable
	@News_id int 								--编号
	AS
	DELETE FROM  News_Table    where News_id=@News_id
GO



--【员工表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_EmployeeTable')
	DROP PROC Select_EmployeeTable
GO
	CREATE PROC Select_EmployeeTable
	AS
	SELECT * FROM Employee_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_EmployeeTable')
	DROP PROC Insert_EmployeeTable
GO
	CREATE PROC Insert_EmployeeTable
	@E_UserName NVARCHAR(16) ,			--用户名
	@E_UserPwd NVARCHAR(16) ,			--密码
	@E_Name NVARCHAR(50) ,				--姓名
	@E_Sex NVARCHAR(8), 				--性别
	@IDT_id Int, 						--证件类型
	@E_IdS NVARCHAR(18), 				--证件号
	@E_School NVARCHAR(100), 			--毕业学校
	@E_Education NVARCHAR(8), 			--学历
	@E_Phone NVARCHAR(11), 				--联系方式
	@E_Address NVARCHAR(200),			--家庭住址
	@Dep_id INT, 						--部门
	@Post_id INT, 						--职位
	@E_Pay money ,						--薪资
	@LS_ID INT, 						--登录状态
	@E_LoginAddress NVARCHAR(200), 		--登录地址
	@E_LoginDate DATETIME, 				--登录时间
	@E_LastLoginAddress NVARCHAR(200), 	--上次登录地址
	@E_LastLoginDate DATETIME, 			--上次登录时间
	@E_Date DATETIME						--注册时间
	AS
	Insert INTO  Employee_Table
	VALUES(@E_UserName,@E_UserPwd,@E_Name,@E_Sex,@IDT_id,@E_IdS,@E_School,@E_Education,
	@E_Phone,@E_Address,@Dep_id,@Post_id,@E_Pay,@LS_ID,@E_LoginAddress,
	@E_LoginDate,@E_LastLoginAddress,@E_LastLoginDate,@E_Date)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_EmployeeTable')
	DROP PROC Update_EmployeeTable
GO
	CREATE PROC Update_EmployeeTable
	@E_id int ,	--编号
	@E_UserName NVARCHAR(16) ,			--用户名
	@E_UserPwd NVARCHAR(16) ,			--密码
	@E_Name NVARCHAR(50) ,				--姓名
	@E_Sex NVARCHAR(8), 				--性别
	@IDT_id Int, 						--证件类型
	@E_IdS NVARCHAR(18), 				--证件号
	@E_School NVARCHAR(100), 			--毕业学校
	@E_Education NVARCHAR(8), 			--学历
	@E_Phone NVARCHAR(11), 				--联系方式
	@E_Address NVARCHAR(200),			--家庭住址
	@Dep_id INT, 						--部门
	@Post_id INT, 						--职位
	@E_Pay money ,						--薪资
	@LS_ID INT, 						--登录状态
	@E_LoginAddress NVARCHAR(200), 		--登录地址
	@E_LoginDate DATETIME, 				--登录时间
	@E_LastLoginAddress NVARCHAR(200), 	--上次登录地址
	@E_LastLoginDate DATETIME, 			--上次登录时间
	@E_Date DATETIME						--注册时间
	AS
	Update  Employee_Table set E_UserName=@E_UserName,E_UserPwd=@E_UserPwd,E_Name=@E_Name,E_Sex=@E_Sex,
	IDT_id=@IDT_id,E_IdS=@E_IdS,E_School=@E_School,E_Education=@E_Education,E_Phone=@E_Phone,
	E_Address=@E_Address,Dep_id=@Dep_id,
	Post_id=@Post_id,E_Pay=@E_Pay,LS_ID=@LS_ID,E_LoginAddress=@E_LoginAddress,E_LoginDate=@E_LoginDate,
	E_LastLoginAddress=@E_LastLoginAddress,E_LastLoginDate=@E_LastLoginDate,E_Date=@E_Date
	where E_id=@E_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_EmployeeTable')
	DROP PROC Delete_EmployeeTable
GO
	CREATE PROC Delete_EmployeeTable
	@E_id int 								--编号
	AS
	DELETE FROM  Employee_Table  where E_id=@E_id
GO




--【部门表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_DepartmentTable')
	DROP PROC Select_DepartmentTable
GO
	CREATE PROC Select_DepartmentTable
	AS
	SELECT * FROM Department_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_DepartmentTable')
	DROP PROC Insert_DepartmentTable
GO
	CREATE PROC Insert_DepartmentTable
	@Dep_Name NVARCHAR(50) 					--名称
	AS
	Insert INTO  Department_Table
	VALUES(@Dep_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_DepartmentTable')
	DROP PROC Update_DepartmentTable
GO
	CREATE PROC Update_DepartmentTable
	@Dep_id int ,	--编号
	@Dep_Name NVARCHAR(50) 					--名称
	AS
	Update  Department_Table set Dep_Name=@Dep_Name
	where Dep_id=@Dep_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_DepartmentTable')
	DROP PROC Delete_DepartmentTable
GO
	CREATE PROC Delete_DepartmentTable
	@Dep_id int 								--编号
	AS
	DELETE FROM  Department_Table  where Dep_id=@Dep_id
GO




--【职位表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_PostTable')
	DROP PROC Select_PostTable
GO
	CREATE PROC Select_PostTable
	AS
	SELECT * FROM Post_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_PostTable')
	DROP PROC Insert_PostTable
GO
	CREATE PROC Insert_PostTable
	@Post_Name NVARCHAR(50) 					--名称
	AS
	Insert INTO  Post_Table
	VALUES(@Post_Name)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_PostTable')
	DROP PROC Update_PostTable
GO
	CREATE PROC Update_PostTable
	@Post_id int,	--编号
	@Post_Name NVARCHAR(50) 				--名称
	AS
	Update  Post_Table set Post_Name=@Post_Name
	where Post_id=@Post_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_PostTable')
	DROP PROC Delete_PostTable
GO
	CREATE PROC Delete_PostTable
	@Post_id int 								--编号
	AS
	DELETE FROM  Post_Table where Post_id=@Post_id
GO




--【招聘表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_JoinUsTable')
	DROP PROC Select_JoinUsTable
GO
	CREATE PROC Select_JoinUsTable
	AS
	SELECT * FROM JoinUs_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_JoinUsTable')
	DROP PROC Insert_JoinUsTable
GO
	CREATE PROC Insert_JoinUsTable
	@JU_Name NVARCHAR(50) ,					--用户名
	@JU_Sex NVARCHAR(8) ,					--性别
	@JU_Phone NVARCHAR(11) ,					--联系方式
	@JU_Address NVARCHAR(200), 				--地址
	@JUP_id Int, 							--招聘岗位
	@JU_SubmitDateTime DateTime 				--提交时间
	AS
	Insert INTO  JoinUs_Table
	VALUES(@JU_Name,@JU_Sex,@JU_Phone,@JU_Address,@JUP_id,@JU_SubmitDateTime)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_JoinUsTable')
	DROP PROC Update_JoinUsTable
GO
	CREATE PROC Update_JoinUsTable
	@JU_id int ,	--编号
	@JU_Name NVARCHAR(50) ,					--用户名
	@JU_Sex NVARCHAR(8) ,					--性别
	@JU_Phone NVARCHAR(11) ,					--联系方式
	@JU_Address NVARCHAR(200), 				--地址
	@JUP_id Int, 							--招聘岗位
	@JU_SubmitDateTime DateTime 				--提交时间
	AS
	Update  JoinUs_Table set JU_Name=@JU_Name,JU_Sex=@JU_Sex,JU_Phone=@JU_Phone,
	JU_Address=@JU_Address,JUP_id=@JUP_id,JU_SubmitDateTime=@JU_SubmitDateTime
	where JU_id=@JU_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_JoinUsTable')
	DROP PROC Delete_JoinUsTable
GO
	CREATE PROC Delete_JoinUsTable
	@JU_id int 								--编号
	AS
	DELETE FROM  JoinUs_Table where JU_id=@JU_id
GO




--【招聘岗位表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_JoinUsPostTable')
	DROP PROC Select_JoinUsPostTable
GO
	CREATE PROC Select_JoinUsPostTable
	AS
	SELECT * FROM JoinUsPost_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_JoinUsPostTable')
	DROP PROC Insert_JoinUsPostTable
GO
	CREATE PROC Insert_JoinUsPostTable
	@JUP_Name NVARCHAR(50) ,					--岗位名称
	@JUP_Number Int							--招聘人数
	AS
	Insert INTO  JoinUsPost_Table
	VALUES(@JUP_Name,@JUP_Number)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_JoinUsPostTable')
	DROP PROC Update_JoinUsPostTable
GO
	CREATE PROC Update_JoinUsPostTable
	@JUP_id int ,	--编号
	@JUP_Name NVARCHAR(50) ,					--岗位名称
	@JUP_Number Int							--招聘人数
	AS
	Update  JoinUsPost_Table set JUP_Name=@JUP_Name,JUP_Number=@JUP_Number
	where JUP_id=@JUP_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_JoinUsPostTable')
	DROP PROC Delete_JoinUsPostTable
GO
	CREATE PROC Delete_JoinUsPostTable
	@JUP_id int 								--编号
	AS
	DELETE FROM  JoinUsPost_Table where JUP_id=@JUP_id
GO




--【评价表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_EvaluateTable')
	DROP PROC Select_EvaluateTable
GO
	CREATE PROC Select_EvaluateTable
	AS
	SELECT * FROM Evaluate_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_EvaluateTable')
	DROP PROC Insert_EvaluateTable
GO
	CREATE PROC Insert_EvaluateTable
	@U_id Int ,								--用户ID
	@P_id Int,								--产品ID
	@Eva_Content NVARCHAR(200) ,				--评价内容
	@Eva_Datetime DateTime					--时间
	AS
	Insert INTO  Evaluate_Table
	VALUES(@U_id,@P_id,@Eva_Content,@Eva_Datetime)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_EvaluateTable')
	DROP PROC Update_EvaluateTable
GO
	CREATE PROC Update_EvaluateTable
	@Eva_id int ,	--编号
	@U_id Int ,								--用户ID
	@P_id Int,								--产品ID
	@Eva_Content NVARCHAR(200) ,				--评价内容
	@Eva_Datetime DateTime					--时间
	AS
	Update  Evaluate_Table set U_id=@U_id,P_id=@P_id,Eva_Content=@Eva_Content,Eva_Datetime=@Eva_Datetime
	where Eva_id=@Eva_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_EvaluateTable')
	DROP PROC Delete_EvaluateTable
GO
	CREATE PROC Delete_EvaluateTable
	@Eva_id int 								--编号
	AS
	DELETE FROM  Evaluate_Table where Eva_id=@Eva_id
GO




--【反馈表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_Feedbackable')
	DROP PROC Select_Feedbackable
GO
	CREATE PROC Select_Feedbackable
	AS
	SELECT * FROM Feedback_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_Feedbackable')
	DROP PROC Insert_Feedbackable
GO
	CREATE PROC Insert_Feedbackable
	@U_id Int ,								--用户ID
	@P_id Int,								--产品ID
	@Feed_Content NVARCHAR(200) ,				--评价内容
	@Feed_Datetime DateTime					--时间
	AS
	Insert INTO  Feedback_Table
	VALUES(@U_id,@P_id,@Feed_Content,@Feed_Datetime)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_Feedbackable')
	DROP PROC Update_Feedbackable
GO
	CREATE PROC Update_Feedbackable
	@Feed_id int ,	--编号
	@U_id Int ,								--用户ID
	@P_id Int,								--产品ID
	@Feed_Content NVARCHAR(200) ,				--评价内容
	@Feed_Datetime DateTime					--时间
	AS
	Update  Feedback_Table set U_id=@U_id,P_id=@P_id,Feed_Content=@Feed_Content,Feed_Datetime=@Feed_Datetime
	where Feed_id=@Feed_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_Feedbackable')
	DROP PROC Delete_Feedbackable
GO
	CREATE PROC Delete_Feedbackable
	@Feed_id int 								--编号
	AS
	DELETE FROM  Feedback_Table where Feed_id=@Feed_id
GO




--【解决方案表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_SolutionTable')
	DROP PROC Select_SolutionTable
GO
	CREATE PROC Select_SolutionTable
	AS
	SELECT * FROM Solution_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_SolutionTable')
	DROP PROC Insert_SolutionTable
GO
	CREATE PROC Insert_SolutionTable
	@P_id INT ,								--产品ID
	@S_tatle NVARCHAR(20) ,					--标题
	@S_Content NVARCHAR(800) ,				--内容
	@S_Datetime DateTime 					--时间
	AS
	Insert INTO  Solution_Table
	VALUES(@P_id,@S_tatle,@S_Content,@S_Datetime)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_SolutionTable')
	DROP PROC Update_SolutionTable
GO
	CREATE PROC Update_SolutionTable
	@S_id int,		--编号
	@P_id INT ,								--产品ID
	@S_tatle NVARCHAR(20) ,					--标题
	@S_Content NVARCHAR(800) ,				--内容
	@S_Datetime DateTime 					--时间
	AS
	Update  Solution_Table set P_id=@P_id,S_tatle=@S_tatle,S_Content=@S_Content,S_Datetime=@S_Datetime
	where S_id=@S_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_SolutionTable')
	DROP PROC Delete_SolutionTable
GO
	CREATE PROC Delete_SolutionTable
	@S_id int 								--编号
	AS
	DELETE FROM  Solution_Table where S_id=@S_id
GO




--【公司信息表】
-------------------查询--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_CompanyTable')
	DROP PROC Select_CompanyTable
GO
	CREATE PROC Select_CompanyTable
	AS
	SELECT * FROM Company_Table									
	
GO
-------------------添加--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_CompanyTable')
	DROP PROC Insert_CompanyTable
GO
	CREATE PROC Insert_CompanyTable
	@Com_Name NVARCHAR(200) ,					--名称
	@Com_Logo image ,							--Logo
	@Com_Introduce NVARCHAR(200) ,				--介绍
	@Com_Honer NVARCHAR(200), 					--荣誉
	@Com_Scope NVARCHAR(200),					--销售范围
	@Com_Scale NVARCHAR(200), 					--规模
	@Com_Course NVARCHAR(200), 					--发展历程
	@Com_Purpose NVARCHAR(200) 					--宗旨
	AS
	Insert INTO  Company_Table
	VALUES(@Com_Name,@Com_Logo,@Com_Introduce,@Com_Honer,@Com_Scope,@Com_Scale,@Com_Course,@Com_Purpose)
GO

-------------------修改--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_CompanyTable')
	DROP PROC Update_CompanyTable
GO
	CREATE PROC Update_CompanyTable
	@Com_id int ,		--编号
	@Com_Name NVARCHAR(200) ,					--名称
	@Com_Logo image ,							--Logo
	@Com_Introduce NVARCHAR(200) ,				--介绍
	@Com_Honer NVARCHAR(200), 					--荣誉
	@Com_Scope NVARCHAR(200),					--销售范围
	@Com_Scale NVARCHAR(200), 					--规模
	@Com_Course NVARCHAR(200), 					--发展历程
	@Com_Purpose NVARCHAR(200) 					--宗旨
	AS
	Update  Company_Table set Com_Name=@Com_Name,Com_Logo=@Com_Logo,Com_Introduce=@Com_Introduce,
	Com_Honer=@Com_Honer,Com_Scope=@Com_Scope,Com_Scale=@Com_Scale,Com_Course=@Com_Course,Com_Purpose=@Com_Purpose
	 where Com_id=@Com_id
GO

-------------------删除--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_CompanyTable')
	DROP PROC Delete_CompanyTable
GO
	CREATE PROC Delete_CompanyTable
	@Com_id int 								--编号
	AS
	DELETE FROM  Company_Table where Com_id=@Com_id
GO



