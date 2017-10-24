USE eChengKJ_DB

GO

--=============================【建立外键】==================================--

-----------------------------------参考格式--------------------------------
--IF Exists(SELECT * FROM sys.objects WHERE name='FK_xxx')
--	ALTER TABLE [外键表名]
--		DROP CONSTRAINT [外键名]
--GO
--	ALTER TABLE [外键表名]
--		ADD CONSTRAINT [外键名]
--			FOREIGN KEY ([外键列名]) REFERENCES [主键表名]([主键列名])

----------------------------------------------------------------------------

--【订单表】
----------产品外键
IF EXISTS(SELECT * FROM sys.objects WHERE name='FK_Order_Pid')
	ALTER TABLE Order_Table
		DROP CONSTRAINT FK_Order_Pid
GO
	ALTER TABLE Order_Table
		ADD CONSTRAINT FK_Order_Pid
			FOREIGN KEY(P_id) REFERENCES Product_Table(P_ID)
GO

----------用户外键
IF EXISTS(SELECT * FROM sys.objects WHERE name='FK_Order_Uid')
	ALTER TABLE Order_Table
		DROP CONSTRAINT FK_Order_Uid
GO
	ALTER TABLE Order_Table
		ADD CONSTRAINT FK_Order_Uid
			FOREIGN KEY(U_id) REFERENCES USER_TABLE(U_ID)
GO

----------管理员外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Order_Eid')
	ALTER TABLE Order_Table
		DROP CONSTRAINT FK_Order_Eid
GO
	ALTER TABLE Order_Table
		ADD CONSTRAINT FK_Order_Eid
			FOREIGN KEY(E_ID) REFERENCES EMPLOYEE_TABLE(E_ID)

----------订单状态外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Order_OStateID')
	ALTER TABLE Order_Table
		DROP CONSTRAINT FK_Order_OStateID
GO
	ALTER TABLE Order_Table
		ADD CONSTRAINT FK_Order_OStateID
			FOREIGN KEY(OState_ID) REFERENCES OrderState_Table(OState_ID)


--【产品表】
----------产品类型外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Product_PTid')
	ALTER TABLE Product_Table
		DROP CONSTRAINT FK_Product_PTid
GO
	ALTER TABLE Product_Table
		ADD CONSTRAINT FK_Product_PTid
			FOREIGN KEY(PT_id) REFERENCES ProductType_Table(PT_id)

GO

----------热门产品外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Product_HPid')
	ALTER TABLE Product_Table
		DROP CONSTRAINT FK_Product_HPid
GO
	ALTER TABLE Product_Table
		ADD CONSTRAINT FK_Product_HPid
			FOREIGN KEY(HP_id) REFERENCES HotProduct_Table(HP_id)

GO

----------新品外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Product_NPid')
	ALTER TABLE Product_Table
		DROP CONSTRAINT FK_Product_NPid
GO
	ALTER TABLE Product_Table
		ADD CONSTRAINT FK_Product_NPid
			FOREIGN KEY(NP_id) REFERENCES NewProduct_Table(NP_id)

GO

----------操作员外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Product_Eid')
	ALTER TABLE Product_Table
		DROP CONSTRAINT FK_Product_Eid
GO
	ALTER TABLE Product_Table
		ADD CONSTRAINT FK_Product_Eid
			FOREIGN KEY(E_ID) REFERENCES EMPLOYEE_TABLE(E_ID)

GO

--【产品试用申请表】
----------申请人外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_ProductTryOur_Uid')
	ALTER TABLE ProductTryOur_Table
		DROP CONSTRAINT FK_ProductTryOur_Uid
GO
	ALTER TABLE ProductTryOur_Table
		ADD CONSTRAINT FK_ProductTryOur_Uid
			FOREIGN KEY(U_id) REFERENCES USER_TABLE(U_id)

GO

----------审核状态外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_ProductTryOur_TOid')
	ALTER TABLE ProductTryOur_Table
		DROP CONSTRAINT FK_ProductTryOur_TOid
GO
	ALTER TABLE ProductTryOur_Table
		ADD CONSTRAINT FK_ProductTryOur_TOid
			FOREIGN KEY(TO_id) REFERENCES TryOut_Table(TO_id)

GO

----------操作人外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_ProductTryOur_Eid')
	ALTER TABLE ProductTryOur_Table
		DROP CONSTRAINT FK_ProductTryOur_Eid
GO
	ALTER TABLE ProductTryOur_Table
		ADD CONSTRAINT FK_ProductTryOur_Eid
			FOREIGN KEY(E_id) REFERENCES EMPLOYEE_TABLE(E_id)

GO

--【用户表】
----------证件类型外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_User_IDTid')
	ALTER TABLE User_Table
		DROP CONSTRAINT FK_User_IDTid
GO
	ALTER TABLE User_Table
		ADD CONSTRAINT FK_User_IDTid
			FOREIGN KEY(IDT_id) REFERENCES IDType_Table(IDT_id)

GO

----------邮箱外键
--IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_User_Mid')
--	ALTER TABLE User_Table
--		DROP CONSTRAINT FK_User_Mid
--GO
--	ALTER TABLE User_Table
--		ADD CONSTRAINT FK_User_Mid
--			FOREIGN KEY(M_id) REFERENCES Mail_Table(M_id)

--GO

----------登录状态外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_User_LSid')
	ALTER TABLE User_Table
		DROP CONSTRAINT FK_User_LSid
GO
	ALTER TABLE User_Table
		ADD CONSTRAINT FK_User_LSid
			FOREIGN KEY(LS_id) REFERENCES LoginState_Table(LS_id)

GO

--【员工表】
----------证件类型外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Employee_LSid')
	ALTER TABLE Employee_Table
		DROP CONSTRAINT FK_Employee_LSid
GO
	ALTER TABLE Employee_Table
		ADD CONSTRAINT FK_Employee_LSid
			FOREIGN KEY(IDT_id) REFERENCES IDType_Table(IDT_id)

GO

----------部门外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Employee_Depid')
	ALTER TABLE Employee_Table
		DROP CONSTRAINT FK_Employee_Depid
GO
	ALTER TABLE Employee_Table
		ADD CONSTRAINT FK_Employee_Depid
			FOREIGN KEY(Dep_id) REFERENCES Department_Table(Dep_id)

GO
----------职位外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Employee_Postid')
	ALTER TABLE Employee_Table
		DROP CONSTRAINT FK_Employee_Postid
GO
	ALTER TABLE Employee_Table
		ADD CONSTRAINT FK_Employee_Postid
			FOREIGN KEY(Post_id) REFERENCES Post_Table(Post_id)

GO

----------登录状态外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Employee_LSid')
	ALTER TABLE Employee_Table
		DROP CONSTRAINT FK_Employee_LSid
GO
	ALTER TABLE Employee_Table
		ADD CONSTRAINT FK_Employee_LSid
			FOREIGN KEY(LS_id) REFERENCES LoginState_Table(LS_id)

GO


--【招聘表】
----------招聘岗位外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_JoinUs_JUPid')
	ALTER TABLE JoinUs_Table
		DROP CONSTRAINT FK_JoinUs_JUPid
GO
	ALTER TABLE JoinUs_Table
		ADD CONSTRAINT FK_JoinUs_JUPid
			FOREIGN KEY(JUP_id) REFERENCES JoinUsPost_Table(JUP_id)

GO

--【评价表】
----------用户外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Evaluate_Uid')
	ALTER TABLE Evaluate_Table
		DROP CONSTRAINT FK_Evaluate_Uid
GO
	ALTER TABLE Evaluate_Table
		ADD CONSTRAINT FK_Evaluate_Uid
			FOREIGN KEY(U_id) REFERENCES USER_TABLE(U_id)

GO

----------产品外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Evaluate_Pid')
	ALTER TABLE Evaluate_Table
		DROP CONSTRAINT FK_Evaluate_Pid
GO
	ALTER TABLE Evaluate_Table
		ADD CONSTRAINT FK_Evaluate_Pid
			FOREIGN KEY(P_id) REFERENCES Product_Table(P_id)

GO


--【反馈表】
----------用户外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Feedback_Uid')
	ALTER TABLE Feedback_Table
		DROP CONSTRAINT FK_Feedback_Uid
GO
	ALTER TABLE Feedback_Table
		ADD CONSTRAINT FK_Feedback_Uid
			FOREIGN KEY(U_id) REFERENCES USER_TABLE(U_id)

GO

----------产品外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Feedback_Pid')
	ALTER TABLE Feedback_Table
		DROP CONSTRAINT FK_Feedback_Pid
GO
	ALTER TABLE Feedback_Table
		ADD CONSTRAINT FK_Feedback_Pid
			FOREIGN KEY(P_id) REFERENCES Product_Table(P_id)

GO

--【解决方案表】
----------产品外键
IF EXISTS(SELECT * FROM sys.objects WHERE NAME='FK_Solution_Uid')
	ALTER TABLE Solution_Table
		DROP CONSTRAINT FK_Solution_Uid
GO
	ALTER TABLE Solution_Table
		ADD CONSTRAINT FK_Solution_Uid
			FOREIGN KEY(P_id) REFERENCES Product_Table(P_id)

GO
