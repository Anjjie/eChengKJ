USE eChengKJ_DB

GO

--=============================�������洢���̡�==================================--

-----------------------------------�ο���ʽ--------------------------------
--IF Exists(SELECT * FROM sys.procedures WHERE name='[��������]_[����]_[��������]')
--	drop proc [��������]_[����]_[��������]
--GO
--	Create proc [��������]_[����]_[��������] 
--	AS
--	[ִ�����]

----------------------------------------------------------------------------

/*
	˵������SQL�ĵ��洢���̴������Ǽ򵥵���ɾ��ģ�
	�����ӵĻ��ߺ���������������һ����SQL�ļ�����д
*/

go

--��������
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_OrderTable')
	DROP PROC Select_OrderTable
GO
	CREATE PROC Select_OrderTable
	AS
	SELECT * FROM Order_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_OrderTable')
	DROP PROC Insert_OrderTable
GO
	CREATE PROC Insert_OrderTable
	@P_id INT ,							--��Ʒ���
	@U_id INT ,							--�����˱��
	@O_LeaveWords NvarChar(200),		--�ͻ�����
	@O_DealWay NvarChar(20),			--֧����ʽ
	@E_id INT ,							--�����˱��
	@O_DateTime Datetime,				--����ʱ��
	@OState_id int,						--����״̬���
	@O_Remark NvarChar(200)				--��ע
	AS
	Insert INTO  Order_Table
	VALUES(@P_id,@U_id,@O_LeaveWords,@O_DealWay,@E_id,@O_DateTime,@OState_id,@O_Remark)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_OrderTable')
	DROP PROC Update_OrderTable
GO
	CREATE PROC Update_OrderTable
	@O_id int,							--�������
	@P_id INT ,							--��Ʒ���
	@U_id INT ,							--�����˱��
	@O_LeaveWords NvarChar(200),		--�ͻ�����
	@O_DealWay NvarChar(20),			--֧����ʽ
	@E_id INT ,							--�����˱��
	@O_DateTime Datetime,				--����ʱ��
	@OState_id int,						--����״̬���
	@O_Remark NvarChar(200)				--��ע
	AS
	Update  Order_Table set P_id=@P_id,U_id=@U_id,O_LeaveWords=@O_LeaveWords,
	O_DealWay=@O_DealWay,E_id=@E_id,O_DateTime=@O_DateTime,OState_id=@OState_id,O_Remark=@O_Remark 
	where O_id=@O_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_OrderTable')
	DROP PROC Delete_OrderTable
GO
	CREATE PROC Delete_OrderTable
	@O_id int							--�������
	AS
	DELETE FROM  Order_Table where O_id=@O_id
GO





--������״̬��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_OrderStateTable')
	DROP PROC Select_OrderStateTable
GO
	CREATE PROC Select_OrderStateTable
	AS
	SELECT * FROM OrderState_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_OrderStateTable')
	DROP PROC Insert_OrderStateTable
GO
	CREATE PROC Insert_OrderStateTable
	@OState_Name NvarChar(50)			--����״̬����
	AS
	Insert INTO  OrderState_Table
	VALUES(@OState_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_OrderStateTable')
	DROP PROC Update_OrderStateTable
GO
	CREATE PROC Update_OrderStateTable
	@OState_id int,							--����״̬���
	@OState_Name NvarChar(50)			--����״̬����
	AS
	Update  OrderState_Table set OState_Name=@OState_Name where OState_id=@OState_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_OrderStateTable')
	DROP PROC Delete_OrderStateTable
GO
	CREATE PROC Delete_OrderStateTable
	@OState_id int								--����״̬���
	AS
	DELETE FROM  OrderState_Table where OState_id=@OState_id
GO




--����Ʒ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_ProductTable')
	DROP PROC Select_ProductTable
GO
	CREATE PROC Select_ProductTable
	AS
	SELECT * FROM Product_Table									
	
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_ProductTable')
	DROP PROC Insert_ProductTable
GO
	CREATE PROC Insert_ProductTable
	@P_No NvarChar(20),						--�Զ����Ʒ���
	@P_Name NvarChar(100),					--��Ʒ����
	@P_Price MONEY,							--��Ʒ�۸�
	@PT_id INT,								--����
	@HP_id INT ,							--�Ƿ�����
	@NP_id INT,								--�Ƿ���Ʒ
	@P_Date DateTIME,						--��������
	@P_Company Nvarchar(200)='e�ϿƼ�' ,	--��Ʒ��˾
	@E_id INT								--������
	AS
	Insert INTO  Product_Table
	VALUES(@P_No,@P_Name,@P_Price,@PT_id,@HP_id,@NP_id,@P_Date,@P_Company,@E_id)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_ProductTable')
	DROP PROC Update_ProductTable
GO
	CREATE PROC Update_ProductTable
	@P_id int,								--��Ʒ���
	@P_No NvarChar(20),						--�Զ����Ʒ���
	@P_Name NvarChar(100),					--��Ʒ����
	@P_Price MONEY,							--��Ʒ�۸�
	@PT_id INT,								--����
	@HP_id INT ,							--�Ƿ�����
	@NP_id INT,								--�Ƿ���Ʒ
	@P_Date DateTIME,						--��������
	@P_Company Nvarchar(200)='e�ϿƼ�' ,	--��Ʒ��˾
	@E_id INT								--������
	AS
	Update  Product_Table set P_No=@P_No,P_Name=@P_Name,P_Price=@P_Price,PT_id =@PT_id,
	HP_id=@HP_id,NP_id=@NP_id,P_Date=@P_Date,P_Company=@P_Company,E_id=@E_id where P_id=@P_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_ProductTable')
	DROP PROC Delete_ProductTable
GO
	CREATE PROC Delete_ProductTable
	@P_id int									--��Ʒ���
	AS
	DELETE FROM  Product_Table where P_id=@P_id
GO



--���Ƿ����Ų�Ʒ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_HotProductTable')
	DROP PROC Select_HotProductTable
GO
	CREATE PROC Select_HotProductTable
	AS
	SELECT * FROM HotProduct_Table									
	
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_HotProductTable')
	DROP PROC Insert_HotProductTable
GO
	CREATE PROC Insert_HotProductTable
	@HP_Name NvarChar(50)					--�Ƿ�����
	AS
	Insert INTO  HotProduct_Table
	VALUES(@HP_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_HotProductTable')
	DROP PROC Update_HotProductTable
GO
	CREATE PROC Update_HotProductTable
	@HP_id int,								--���ű��
	@HP_Name NvarChar(50)					--�Ƿ�����
	AS
	Update  HotProduct_Table set HP_Name=@HP_Name where HP_id=@HP_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_HotProductTable')
	DROP PROC Delete_HotProductTable
GO
	CREATE PROC Delete_HotProductTable
	@HP_id int								--���ű��
	AS
	DELETE FROM  HotProduct_Table where HP_id=@HP_id
GO




--���Ƿ��²�Ʒ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_NewProductTable')
	DROP PROC Select_NewProductTable
GO
	CREATE PROC Select_NewProductTable
	AS
	SELECT * FROM NewProduct_Table									

	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_NewProductTable')
	DROP PROC Insert_NewProductTable
GO
	CREATE PROC Insert_NewProductTable
	@NP_Name NvarChar(50)					--�Ƿ��²�Ʒ
	AS
	Insert INTO  NewProduct_Table
	VALUES(@NP_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_NewProductTable')
	DROP PROC Update_NewProductTable
GO
	CREATE PROC Update_NewProductTable
	@NP_id int,								--�²�Ʒ���
	@NP_Name NvarChar(50)					--�Ƿ��²�Ʒ
	AS
	Update  NewProduct_Table set NP_Name=@NP_Name where NP_id=@NP_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_NewProductTable')
	DROP PROC Delete_NewProductTable
GO
	CREATE PROC Delete_NewProductTable
	@NP_id int								--�²�Ʒ���
	AS
	DELETE FROM  NewProduct_Table where NP_id=@NP_id
GO



--����Ʒ���ͱ�
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_ProductTypeTable')
	DROP PROC Select_ProductTypeTable
GO
	CREATE PROC Select_ProductTypeTable
	AS
	SELECT * FROM ProductType_Table									
	
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_ProductTypeTable')
	DROP PROC Insert_ProductTypeTable
GO
	CREATE PROC Insert_ProductTypeTable
	@PT_Name NvarChar(50)					--��Ʒ��������
	AS
	Insert INTO  ProductType_Table
	VALUES(@PT_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_ProductTypeTable')
	DROP PROC Update_ProductTypeTable
GO
	CREATE PROC Update_ProductTypeTable
	@PT_id int,								--���
	@PT_Name NvarChar(50)					--��Ʒ��������
	AS
	Update  ProductType_Table set PT_Name=@PT_Name where PT_id=@PT_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_ProductTypeTable')
	DROP PROC Delete_ProductTypeTable
GO
	CREATE PROC Delete_ProductTypeTable
	@PT_id int								--���
	AS
	DELETE FROM  ProductType_Table where PT_id=@PT_id
GO



--����Ʒ���������
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_ProductTryOurTable')
	DROP PROC Select_ProductTryOurTable
GO
	CREATE PROC Select_ProductTryOurTable
	AS
	SELECT * FROM ProductTryOur_Table									
	
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_ProductTryOurTable')
	DROP PROC Insert_ProductTryOurTable
GO
	CREATE PROC Insert_ProductTryOurTable
	@PTO_Name NvarChar(50),  --��˾����
	@U_id INT ,  --������
	@PTO_ApplyFor DATE,  --��������
	@TO_id INT ,	--���״̬
	@E_id INT ,  --�����ˣ�����Ա��
	@PTO_AuditDate Datetime,	--����ʱ��
	@PTO_Activate INT ,  --�Ƿ񼤻�
	@PTO_ExpireDate Datetime,   --����ʱ��
	@PTO_Remark NvarChar(200)  --��ע 
	AS
	Insert INTO  ProductTryOur_Table
	VALUES(@PTO_Name,@U_id,@PTO_ApplyFor,@TO_id,@E_id,@PTO_AuditDate,@PTO_Activate,@PTO_ExpireDate,
	@PTO_Remark)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_ProductTryOurTable')
	DROP PROC Update_ProductTryOurTable
GO
	CREATE PROC Update_ProductTryOurTable
	@PTO_id Int ,  --���
	@PTO_Name NvarChar(50),  --��˾����
	@U_id INT ,  --������
	@PTO_ApplyFor DATE,  --��������
	@TO_id INT ,	--���״̬
	@E_id INT ,  --�����ˣ�����Ա��
	@PTO_AuditDate Datetime,	--����ʱ��
	@PTO_Activate INT ,  --�Ƿ񼤻�
	@PTO_ExpireDate Datetime,   --����ʱ��
	@PTO_Remark NvarChar(200)  --��ע 
	AS
	Update  ProductTryOur_Table set PTO_Name=@PTO_Name,U_id=@U_id,PTO_ApplyFor=@PTO_ApplyFor,
	TO_id=@TO_id,E_id=@E_id,PTO_AuditDate=@PTO_AuditDate,PTO_Activate=@PTO_Activate,
	PTO_ExpireDate=@PTO_ExpireDate,PTO_Remark=@PTO_Remark
	 where PTO_id=@PTO_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_ProductTryOurTable')
	DROP PROC Delete_ProductTryOurTable
GO
	CREATE PROC Delete_ProductTryOurTable
	@PTO_id Int   --���
	AS
	DELETE FROM  ProductTryOur_Table where PTO_id=@PTO_id
GO





--���������״̬��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_TryOutTable')
	DROP PROC Select_TryOutTable
GO
	CREATE PROC Select_TryOutTable
	AS
	SELECT * FROM TryOut_Table									
	
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_TryOutTable')
	DROP PROC Insert_TryOutTable
GO
	CREATE PROC Insert_TryOutTable
	@TO_Name NvarChar(50)				--״̬����
	AS
	Insert INTO  TryOut_Table
	VALUES(@TO_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_TryOutTable')
	DROP PROC Update_TryOutTable
GO
	CREATE PROC Update_TryOutTable
	@TO_id int,							--״̬���
	@TO_Name NvarChar(50)				--״̬����
	AS
	Update  TryOut_Table set TO_Name=@TO_Name where TO_id=@TO_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_TryOutTable')
	DROP PROC Delete_TryOutTable
GO
	CREATE PROC Delete_TryOutTable
	@TO_id int							--״̬���
	AS
	DELETE FROM  TryOut_Table where TO_id=@TO_id
GO



--���û���
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_UserTable')
	DROP PROC Select_UserTable
GO
	CREATE PROC Select_UserTable
	AS
	SELECT * FROM User_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_UserTable')
	DROP PROC Insert_UserTable
GO
	CREATE PROC Insert_UserTable
	@U_UserName NVARCHAR(16) ,				--�û���
	@U_UserPwd NVARCHAR(16) ,				--����
	@U_Head NVARCHAR(300) ,					--ͷ��
	@U_Name NVARCHAR(50) ,					--����
	@U_Sex NVARCHAR(4) ,					--�Ա�
	@IDT_id Int ,							--֤������
	@U_IDS NVARCHAR(18) ,					--֤������
	@U_Phone NVARCHAR(11) ,					--�ֻ�����
	@M_id INT ,								--����
	@U_Company NVARCHAR(300) ,				--���ڹ�˾
	@U_ComPanyAddress NVARCHAR(300) ,		--��˾��ַ
	@U_PhoneVerify NVARCHAR(5),				--�ֻ���֤�루��̬��
	@LS_id INT ,							--��¼״̬
	@U_LoginAddress NVARCHAR(300) ,			--��¼��ַ
	@U_LoginDatetime DateTime,				--��¼ʱ��
	@U_LastLoginAddress NVARCHAR(300) ,		--�ϴε�¼��ַ
	@U_LastLoginDatetime DateTime ,			--�ϴε�¼ʱ��
	@U_CreateUserDate DateTime				--��������
	AS
	Insert INTO  User_Table
	VALUES(@U_UserName,@U_UserPwd,@U_Head,@U_Name,@U_Sex,@IDT_id,@U_IDS,@U_Phone,@M_id,@U_Company,
	@U_ComPanyAddress,@U_PhoneVerify,@LS_id,@U_LoginAddress,@U_LoginDatetime,@U_LastLoginAddress,@U_LastLoginDatetime,@U_CreateUserDate)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_UserTable')
	DROP PROC Update_UserTable
GO
	CREATE PROC Update_UserTable
	@U_id int ,								--���
	@U_UserName NVARCHAR(16) ,				--�û���
	@U_UserPwd NVARCHAR(16) ,				--����
	@U_Head NVARCHAR(300) ,					--ͷ��
	@U_Name NVARCHAR(50) ,					--����
	@U_Sex NVARCHAR(4) ,					--�Ա�
	@IDT_id Int ,							--֤������
	@U_IDS NVARCHAR(18) ,					--֤������
	@U_Phone NVARCHAR(11) ,					--�ֻ�����
	@M_id INT ,								--����
	@U_Company NVARCHAR(300) ,				--���ڹ�˾
	@U_ComPanyAddress NVARCHAR(300) ,		--��˾��ַ
	@U_PhoneVerify NVARCHAR(5),				--�ֻ���֤�루��̬��
	@LS_id INT ,							--��¼״̬
	@U_LoginAddress NVARCHAR(300) ,			--��¼��ַ
	@U_LoginDatetime DateTime,				--��¼ʱ��
	@U_LastLoginAddress NVARCHAR(300) ,		--�ϴε�¼��ַ
	@U_LastLoginDatetime DateTime ,			--�ϴε�¼ʱ��
	@U_CreateUserDate DateTime 				--��������
	AS
	Update  User_Table set U_UserName=@U_UserName,U_UserPwd=@U_UserPwd,U_Head=@U_Head,U_Name=@U_Name,
	U_Sex=@U_Sex,IDT_id=@IDT_id,U_IDS=@U_IDS,U_Phone=@U_Phone,M_id=@M_id,U_Company=@U_Company,
	U_ComPanyAddress=@U_ComPanyAddress,U_PhoneVerify=@U_PhoneVerify,
	LS_id=@LS_id,U_LoginAddress=@U_LoginAddress,
	U_LoginDatetime=@U_LoginDatetime,U_LastLoginAddress=@U_LastLoginAddress,
	U_LastLoginDatetime=@U_LastLoginDatetime,U_CreateUserDate=@U_CreateUserDate
	 where U_id=@U_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_UserTable')
	DROP PROC Delete_UserTable
GO
	CREATE PROC Delete_UserTable
	@U_id int 								--���
	AS
	DELETE FROM  User_Table where U_id=@U_id
GO




--�������
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_MailTable')
	DROP PROC Select_MailTable
GO
	CREATE PROC Select_MailTable
	AS
	SELECT * FROM Mail_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_MailTable')
	DROP PROC Insert_MailTable
GO
	CREATE PROC Insert_MailTable
	@M_Mail NVARCHAR(16) ,					--�����
	@M_YesNo NvarChar(4)					--�Ƿ񼤻�
	AS
	Insert INTO  Mail_Table
	VALUES(@M_Mail,@M_YesNo)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_MailTable')
	DROP PROC Update_MailTable
GO
	CREATE PROC Update_MailTable
	@M_id int ,								--���
	@M_Mail NVARCHAR(16) ,					--�����
	@M_YesNo NvarChar(4)					--�Ƿ񼤻�
	AS
	Update  Mail_Table set M_Mail=@M_Mail,M_YesNo=@M_YesNo
	 where M_id=@M_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_MailTable')
	DROP PROC Delete_MailTable
GO
	CREATE PROC Delete_MailTable
	@M_id int 								--���
	AS
	DELETE FROM  Mail_Table  where M_id=@M_id
GO




--����¼״̬��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_LoginStateTable')
	DROP PROC Select_LoginStateTable
GO
	CREATE PROC Select_LoginStateTable
	AS
	SELECT * FROM LoginState_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_LoginStateTable')
	DROP PROC Insert_LoginStateTable
GO
	CREATE PROC Insert_LoginStateTable
	@LS_Name NVARCHAR(50) 					--��¼״̬����
	AS
	Insert INTO  LoginState_Table
	VALUES(@LS_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_LoginStateTable')
	DROP PROC Update_LoginStateTable
GO
	CREATE PROC Update_LoginStateTable
	@LS_id int ,							--��¼״̬���
	@LS_Name NVARCHAR(50)					--��¼״̬����
	AS
	Update  LoginState_Table set LS_Name=@LS_Name
	 where LS_id=@LS_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_LoginStateTable')
	DROP PROC Delete_LoginStateTable
GO
	CREATE PROC Delete_LoginStateTable
	@LS_id int 								--���
	AS
	DELETE FROM  LoginState_Table   where LS_id=@LS_id
GO





--��֤�����ͱ�
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_IDTypeTable')
	DROP PROC Select_IDTypeTable
GO
	CREATE PROC Select_IDTypeTable
	AS
	SELECT * FROM IDType_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_IDTypeTable')
	DROP PROC Insert_IDTypeTable
GO
	CREATE PROC Insert_IDTypeTable
	@IDT_Name NVARCHAR(50) 					--֤������
	AS
	Insert INTO  IDType_Table
	VALUES(@IDT_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_IDTypeTable')
	DROP PROC Update_IDTypeTable
GO
	CREATE PROC Update_IDTypeTable
	@IDT_id int ,	--���
	@IDT_Name NVARCHAR(50) 					--֤������
	AS
	Update  IDType_Table set IDT_Name=@IDT_Name
	 where IDT_id=@IDT_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_IDTypeTable')
	DROP PROC Delete_IDTypeTable
GO
	CREATE PROC Delete_IDTypeTable
	@IDT_id int 								--���
	AS
	DELETE FROM  IDType_Table    where IDT_id=@IDT_id
GO



--���ܱ���
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_IssueAnswerTable')
	DROP PROC Select_IssueAnswerTable
GO
	CREATE PROC Select_IssueAnswerTable
	AS
	SELECT * FROM IssueAnswer_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_IssueAnswerTable')
	DROP PROC Insert_IssueAnswerTable
GO
	CREATE PROC Insert_IssueAnswerTable
	@U_UserName NVARCHAR(16) ,				--�û��˺�
	@IA_Issue1 NVARCHAR(300) ,				--����1
	@IA_Issue2 NVARCHAR(300) ,				--����2
	@IA_Issue3 NVARCHAR(300) ,				--����3
	@IA_Answer1 NVARCHAR(300) ,				--��1
	@IA_Answer2 NVARCHAR(300) ,				--��2
	@IA_Answer3 NVARCHAR(300) 				--��3
	AS
	Insert INTO  IssueAnswer_Table
	VALUES(@U_UserName,@IA_Issue1,@IA_Issue2,@IA_Issue3,@IA_Answer1,@IA_Answer2,@IA_Answer3)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_IssueAnswerTable')
	DROP PROC Update_IssueAnswerTable
GO
	CREATE PROC Update_IssueAnswerTable
	@IA_id int ,	--���
	@U_UserName NVARCHAR(16) ,				--�û��˺�
	@IA_Issue1 NVARCHAR(300) ,				--����1
	@IA_Issue2 NVARCHAR(300) ,				--����2
	@IA_Issue3 NVARCHAR(300) ,				--����3
	@IA_Answer1 NVARCHAR(300) ,				--��1
	@IA_Answer2 NVARCHAR(300) ,				--��2
	@IA_Answer3 NVARCHAR(300) 				--��3
	AS
	Update  IssueAnswer_Table set U_UserName=@U_UserName,IA_Issue1=@IA_Issue1,IA_Issue2=@IA_Issue2,
	IA_Issue3=@IA_Issue3,IA_Answer1=@IA_Answer1,IA_Answer2=@IA_Answer2,IA_Answer3=@IA_Answer3
	where IA_id=@IA_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_IssueAnswerTable')
	DROP PROC Delete_IssueAnswerTable
GO
	CREATE PROC Delete_IssueAnswerTable
	@IA_id int 								--���
	AS
	DELETE FROM  IssueAnswer_Table    where IA_id=@IA_id
GO




--�����ű�
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_NewsTable')
	DROP PROC Select_NewsTable
GO
	CREATE PROC Select_NewsTable
	AS
	SELECT * FROM News_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_NewsTable')
	DROP PROC Insert_NewsTable
GO
	CREATE PROC Insert_NewsTable
	@News_Name NVARCHAR(16) ,				--���ű���
	@News_Content NVARCHAR(300) ,			--��������
	@News_Anthor NVARCHAR(300) ,				--��������
	@News_Date NVARCHAR(300) 				--����ʱ��
	AS
	Insert INTO  News_Table
	VALUES(@News_Name,@News_Content,@News_Anthor,@News_Date)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_NewsTable')
	DROP PROC Update_NewsTable
GO
	CREATE PROC Update_NewsTable
	@News_id int ,							--���
	@News_Name NVARCHAR(16) ,				--���ű���
	@News_Content NVARCHAR(300) ,			--��������
	@News_Anthor NVARCHAR(300) ,				--��������
	@News_Date NVARCHAR(300) 				--����ʱ��
	AS
	Update  News_Table set News_Name=@News_Name,News_Content=@News_Content,News_Anthor=@News_Anthor,
	News_Date=@News_Date
	where News_id=@News_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_NewsTable')
	DROP PROC Delete_NewsTable
GO
	CREATE PROC Delete_NewsTable
	@News_id int 								--���
	AS
	DELETE FROM  News_Table    where News_id=@News_id
GO



--��Ա����
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_EmployeeTable')
	DROP PROC Select_EmployeeTable
GO
	CREATE PROC Select_EmployeeTable
	AS
	SELECT * FROM Employee_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_EmployeeTable')
	DROP PROC Insert_EmployeeTable
GO
	CREATE PROC Insert_EmployeeTable
	@E_UserName NVARCHAR(16) ,			--�û���
	@E_UserPwd NVARCHAR(16) ,			--����
	@E_Name NVARCHAR(50) ,				--����
	@E_Sex NVARCHAR(8), 				--�Ա�
	@IDT_id Int, 						--֤������
	@E_IdS NVARCHAR(18), 				--֤����
	@E_School NVARCHAR(100), 			--��ҵѧУ
	@E_Education NVARCHAR(8), 			--ѧ��
	@E_Phone NVARCHAR(11), 				--��ϵ��ʽ
	@E_Address NVARCHAR(200),			--��ͥסַ
	@Dep_id INT, 						--����
	@Post_id INT, 						--ְλ
	@E_Pay money ,						--н��
	@LS_ID INT, 						--��¼״̬
	@E_LoginAddress NVARCHAR(200), 		--��¼��ַ
	@E_LoginDate DATETIME, 				--��¼ʱ��
	@E_LastLoginAddress NVARCHAR(200), 	--�ϴε�¼��ַ
	@E_LastLoginDate DATETIME, 			--�ϴε�¼ʱ��
	@E_Date DATETIME						--ע��ʱ��
	AS
	Insert INTO  Employee_Table
	VALUES(@E_UserName,@E_UserPwd,@E_Name,@E_Sex,@IDT_id,@E_IdS,@E_School,@E_Education,
	@E_Phone,@E_Address,@Dep_id,@Post_id,@E_Pay,@LS_ID,@E_LoginAddress,
	@E_LoginDate,@E_LastLoginAddress,@E_LastLoginDate,@E_Date)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_EmployeeTable')
	DROP PROC Update_EmployeeTable
GO
	CREATE PROC Update_EmployeeTable
	@E_id int ,	--���
	@E_UserName NVARCHAR(16) ,			--�û���
	@E_UserPwd NVARCHAR(16) ,			--����
	@E_Name NVARCHAR(50) ,				--����
	@E_Sex NVARCHAR(8), 				--�Ա�
	@IDT_id Int, 						--֤������
	@E_IdS NVARCHAR(18), 				--֤����
	@E_School NVARCHAR(100), 			--��ҵѧУ
	@E_Education NVARCHAR(8), 			--ѧ��
	@E_Phone NVARCHAR(11), 				--��ϵ��ʽ
	@E_Address NVARCHAR(200),			--��ͥסַ
	@Dep_id INT, 						--����
	@Post_id INT, 						--ְλ
	@E_Pay money ,						--н��
	@LS_ID INT, 						--��¼״̬
	@E_LoginAddress NVARCHAR(200), 		--��¼��ַ
	@E_LoginDate DATETIME, 				--��¼ʱ��
	@E_LastLoginAddress NVARCHAR(200), 	--�ϴε�¼��ַ
	@E_LastLoginDate DATETIME, 			--�ϴε�¼ʱ��
	@E_Date DATETIME						--ע��ʱ��
	AS
	Update  Employee_Table set E_UserName=@E_UserName,E_UserPwd=@E_UserPwd,E_Name=@E_Name,E_Sex=@E_Sex,
	IDT_id=@IDT_id,E_IdS=@E_IdS,E_School=@E_School,E_Education=@E_Education,E_Phone=@E_Phone,
	E_Address=@E_Address,Dep_id=@Dep_id,
	Post_id=@Post_id,E_Pay=@E_Pay,LS_ID=@LS_ID,E_LoginAddress=@E_LoginAddress,E_LoginDate=@E_LoginDate,
	E_LastLoginAddress=@E_LastLoginAddress,E_LastLoginDate=@E_LastLoginDate,E_Date=@E_Date
	where E_id=@E_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_EmployeeTable')
	DROP PROC Delete_EmployeeTable
GO
	CREATE PROC Delete_EmployeeTable
	@E_id int 								--���
	AS
	DELETE FROM  Employee_Table  where E_id=@E_id
GO




--�����ű�
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_DepartmentTable')
	DROP PROC Select_DepartmentTable
GO
	CREATE PROC Select_DepartmentTable
	AS
	SELECT * FROM Department_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_DepartmentTable')
	DROP PROC Insert_DepartmentTable
GO
	CREATE PROC Insert_DepartmentTable
	@Dep_Name NVARCHAR(50) 					--����
	AS
	Insert INTO  Department_Table
	VALUES(@Dep_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_DepartmentTable')
	DROP PROC Update_DepartmentTable
GO
	CREATE PROC Update_DepartmentTable
	@Dep_id int ,	--���
	@Dep_Name NVARCHAR(50) 					--����
	AS
	Update  Department_Table set Dep_Name=@Dep_Name
	where Dep_id=@Dep_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_DepartmentTable')
	DROP PROC Delete_DepartmentTable
GO
	CREATE PROC Delete_DepartmentTable
	@Dep_id int 								--���
	AS
	DELETE FROM  Department_Table  where Dep_id=@Dep_id
GO




--��ְλ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_PostTable')
	DROP PROC Select_PostTable
GO
	CREATE PROC Select_PostTable
	AS
	SELECT * FROM Post_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_PostTable')
	DROP PROC Insert_PostTable
GO
	CREATE PROC Insert_PostTable
	@Post_Name NVARCHAR(50) 					--����
	AS
	Insert INTO  Post_Table
	VALUES(@Post_Name)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_PostTable')
	DROP PROC Update_PostTable
GO
	CREATE PROC Update_PostTable
	@Post_id int,	--���
	@Post_Name NVARCHAR(50) 				--����
	AS
	Update  Post_Table set Post_Name=@Post_Name
	where Post_id=@Post_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_PostTable')
	DROP PROC Delete_PostTable
GO
	CREATE PROC Delete_PostTable
	@Post_id int 								--���
	AS
	DELETE FROM  Post_Table where Post_id=@Post_id
GO




--����Ƹ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_JoinUsTable')
	DROP PROC Select_JoinUsTable
GO
	CREATE PROC Select_JoinUsTable
	AS
	SELECT * FROM JoinUs_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_JoinUsTable')
	DROP PROC Insert_JoinUsTable
GO
	CREATE PROC Insert_JoinUsTable
	@JU_Name NVARCHAR(50) ,					--�û���
	@JU_Sex NVARCHAR(8) ,					--�Ա�
	@JU_Phone NVARCHAR(11) ,					--��ϵ��ʽ
	@JU_Address NVARCHAR(200), 				--��ַ
	@JUP_id Int, 							--��Ƹ��λ
	@JU_SubmitDateTime DateTime 				--�ύʱ��
	AS
	Insert INTO  JoinUs_Table
	VALUES(@JU_Name,@JU_Sex,@JU_Phone,@JU_Address,@JUP_id,@JU_SubmitDateTime)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_JoinUsTable')
	DROP PROC Update_JoinUsTable
GO
	CREATE PROC Update_JoinUsTable
	@JU_id int ,	--���
	@JU_Name NVARCHAR(50) ,					--�û���
	@JU_Sex NVARCHAR(8) ,					--�Ա�
	@JU_Phone NVARCHAR(11) ,					--��ϵ��ʽ
	@JU_Address NVARCHAR(200), 				--��ַ
	@JUP_id Int, 							--��Ƹ��λ
	@JU_SubmitDateTime DateTime 				--�ύʱ��
	AS
	Update  JoinUs_Table set JU_Name=@JU_Name,JU_Sex=@JU_Sex,JU_Phone=@JU_Phone,
	JU_Address=@JU_Address,JUP_id=@JUP_id,JU_SubmitDateTime=@JU_SubmitDateTime
	where JU_id=@JU_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_JoinUsTable')
	DROP PROC Delete_JoinUsTable
GO
	CREATE PROC Delete_JoinUsTable
	@JU_id int 								--���
	AS
	DELETE FROM  JoinUs_Table where JU_id=@JU_id
GO




--����Ƹ��λ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_JoinUsPostTable')
	DROP PROC Select_JoinUsPostTable
GO
	CREATE PROC Select_JoinUsPostTable
	AS
	SELECT * FROM JoinUsPost_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_JoinUsPostTable')
	DROP PROC Insert_JoinUsPostTable
GO
	CREATE PROC Insert_JoinUsPostTable
	@JUP_Name NVARCHAR(50) ,					--��λ����
	@JUP_Number Int							--��Ƹ����
	AS
	Insert INTO  JoinUsPost_Table
	VALUES(@JUP_Name,@JUP_Number)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_JoinUsPostTable')
	DROP PROC Update_JoinUsPostTable
GO
	CREATE PROC Update_JoinUsPostTable
	@JUP_id int ,	--���
	@JUP_Name NVARCHAR(50) ,					--��λ����
	@JUP_Number Int							--��Ƹ����
	AS
	Update  JoinUsPost_Table set JUP_Name=@JUP_Name,JUP_Number=@JUP_Number
	where JUP_id=@JUP_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_JoinUsPostTable')
	DROP PROC Delete_JoinUsPostTable
GO
	CREATE PROC Delete_JoinUsPostTable
	@JUP_id int 								--���
	AS
	DELETE FROM  JoinUsPost_Table where JUP_id=@JUP_id
GO




--�����۱�
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_EvaluateTable')
	DROP PROC Select_EvaluateTable
GO
	CREATE PROC Select_EvaluateTable
	AS
	SELECT * FROM Evaluate_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_EvaluateTable')
	DROP PROC Insert_EvaluateTable
GO
	CREATE PROC Insert_EvaluateTable
	@U_id Int ,								--�û�ID
	@P_id Int,								--��ƷID
	@Eva_Content NVARCHAR(200) ,				--��������
	@Eva_Datetime DateTime					--ʱ��
	AS
	Insert INTO  Evaluate_Table
	VALUES(@U_id,@P_id,@Eva_Content,@Eva_Datetime)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_EvaluateTable')
	DROP PROC Update_EvaluateTable
GO
	CREATE PROC Update_EvaluateTable
	@Eva_id int ,	--���
	@U_id Int ,								--�û�ID
	@P_id Int,								--��ƷID
	@Eva_Content NVARCHAR(200) ,				--��������
	@Eva_Datetime DateTime					--ʱ��
	AS
	Update  Evaluate_Table set U_id=@U_id,P_id=@P_id,Eva_Content=@Eva_Content,Eva_Datetime=@Eva_Datetime
	where Eva_id=@Eva_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_EvaluateTable')
	DROP PROC Delete_EvaluateTable
GO
	CREATE PROC Delete_EvaluateTable
	@Eva_id int 								--���
	AS
	DELETE FROM  Evaluate_Table where Eva_id=@Eva_id
GO




--��������
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_Feedbackable')
	DROP PROC Select_Feedbackable
GO
	CREATE PROC Select_Feedbackable
	AS
	SELECT * FROM Feedback_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_Feedbackable')
	DROP PROC Insert_Feedbackable
GO
	CREATE PROC Insert_Feedbackable
	@U_id Int ,								--�û�ID
	@P_id Int,								--��ƷID
	@Feed_Content NVARCHAR(200) ,				--��������
	@Feed_Datetime DateTime					--ʱ��
	AS
	Insert INTO  Feedback_Table
	VALUES(@U_id,@P_id,@Feed_Content,@Feed_Datetime)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_Feedbackable')
	DROP PROC Update_Feedbackable
GO
	CREATE PROC Update_Feedbackable
	@Feed_id int ,	--���
	@U_id Int ,								--�û�ID
	@P_id Int,								--��ƷID
	@Feed_Content NVARCHAR(200) ,				--��������
	@Feed_Datetime DateTime					--ʱ��
	AS
	Update  Feedback_Table set U_id=@U_id,P_id=@P_id,Feed_Content=@Feed_Content,Feed_Datetime=@Feed_Datetime
	where Feed_id=@Feed_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_Feedbackable')
	DROP PROC Delete_Feedbackable
GO
	CREATE PROC Delete_Feedbackable
	@Feed_id int 								--���
	AS
	DELETE FROM  Feedback_Table where Feed_id=@Feed_id
GO




--�����������
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_SolutionTable')
	DROP PROC Select_SolutionTable
GO
	CREATE PROC Select_SolutionTable
	AS
	SELECT * FROM Solution_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_SolutionTable')
	DROP PROC Insert_SolutionTable
GO
	CREATE PROC Insert_SolutionTable
	@P_id INT ,								--��ƷID
	@S_tatle NVARCHAR(20) ,					--����
	@S_Content NVARCHAR(800) ,				--����
	@S_Datetime DateTime 					--ʱ��
	AS
	Insert INTO  Solution_Table
	VALUES(@P_id,@S_tatle,@S_Content,@S_Datetime)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_SolutionTable')
	DROP PROC Update_SolutionTable
GO
	CREATE PROC Update_SolutionTable
	@S_id int,		--���
	@P_id INT ,								--��ƷID
	@S_tatle NVARCHAR(20) ,					--����
	@S_Content NVARCHAR(800) ,				--����
	@S_Datetime DateTime 					--ʱ��
	AS
	Update  Solution_Table set P_id=@P_id,S_tatle=@S_tatle,S_Content=@S_Content,S_Datetime=@S_Datetime
	where S_id=@S_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_SolutionTable')
	DROP PROC Delete_SolutionTable
GO
	CREATE PROC Delete_SolutionTable
	@S_id int 								--���
	AS
	DELETE FROM  Solution_Table where S_id=@S_id
GO




--����˾��Ϣ��
-------------------��ѯ--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Select_CompanyTable')
	DROP PROC Select_CompanyTable
GO
	CREATE PROC Select_CompanyTable
	AS
	SELECT * FROM Company_Table									
	
GO
-------------------���--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Insert_CompanyTable')
	DROP PROC Insert_CompanyTable
GO
	CREATE PROC Insert_CompanyTable
	@Com_Name NVARCHAR(200) ,					--����
	@Com_Logo image ,							--Logo
	@Com_Introduce NVARCHAR(200) ,				--����
	@Com_Honer NVARCHAR(200), 					--����
	@Com_Scope NVARCHAR(200),					--���۷�Χ
	@Com_Scale NVARCHAR(200), 					--��ģ
	@Com_Course NVARCHAR(200), 					--��չ����
	@Com_Purpose NVARCHAR(200) 					--��ּ
	AS
	Insert INTO  Company_Table
	VALUES(@Com_Name,@Com_Logo,@Com_Introduce,@Com_Honer,@Com_Scope,@Com_Scale,@Com_Course,@Com_Purpose)
GO

-------------------�޸�--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Update_CompanyTable')
	DROP PROC Update_CompanyTable
GO
	CREATE PROC Update_CompanyTable
	@Com_id int ,		--���
	@Com_Name NVARCHAR(200) ,					--����
	@Com_Logo image ,							--Logo
	@Com_Introduce NVARCHAR(200) ,				--����
	@Com_Honer NVARCHAR(200), 					--����
	@Com_Scope NVARCHAR(200),					--���۷�Χ
	@Com_Scale NVARCHAR(200), 					--��ģ
	@Com_Course NVARCHAR(200), 					--��չ����
	@Com_Purpose NVARCHAR(200) 					--��ּ
	AS
	Update  Company_Table set Com_Name=@Com_Name,Com_Logo=@Com_Logo,Com_Introduce=@Com_Introduce,
	Com_Honer=@Com_Honer,Com_Scope=@Com_Scope,Com_Scale=@Com_Scale,Com_Course=@Com_Course,Com_Purpose=@Com_Purpose
	 where Com_id=@Com_id
GO

-------------------ɾ��--------------------------
IF EXISTS(SELECT * FROM sys.procedures WHERE name='Delete_CompanyTable')
	DROP PROC Delete_CompanyTable
GO
	CREATE PROC Delete_CompanyTable
	@Com_id int 								--���
	AS
	DELETE FROM  Company_Table where Com_id=@Com_id
GO



