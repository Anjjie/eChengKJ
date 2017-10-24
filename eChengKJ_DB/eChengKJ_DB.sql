--use master
--GO
--IF DB_ID('eChengKJ_DB') IS NOT NULL
--  DROP DATABASE eChengKJ_DB
--GO
-- CREATE DATABASE eChengKJ_DB
-- ON(
--	NAME='eChengKJ_DB',
--	FILENAME='D:\ѧϰ����\�Ϸ�ITѧԺ��ѧ��ѧϰ����\������Ŀ\e�ϿƼ�\e�ϿƼ���վ\eChengKJ\eChengKJ_DB\eChengKJ_DB.MDF'
-- )
 
 GO
USE eChengKJ_DB

--------------��������----------------------------------
GO
IF OBJECT_ID('Order_Table') IS NOT NULL
   DROP TABLE Order_Table
GO
 CREATE TABLE Order_Table
 (
	O_id INT IDENTITY(0,1) PRIMARY KEY, --���
	P_id INT ,							--��Ʒ���
	U_id INT ,							--�����˱��
	O_LeaveWords NvarChar(200),			--�ͻ�����
	O_DealWay NvarChar(20),				--֧����ʽ
	E_id INT ,							--�����˱��
	O_DateTime Datetime,				--����ʱ��
	OState_id int,						--����״̬���
	O_Remark NvarChar(200)				--��ע
 ) 
 
--------------������״̬��----------------------------------
GO
IF OBJECT_ID('OrderState_Table') IS NOT NULL
   DROP TABLE OrderState_Table
GO
 CREATE TABLE OrderState_Table
 (
	OState_id  int IDENTITY(0,1) PRIMARY KEY,	--����״̬���
	OState_Name NvarChar(50)					--����״̬����
 ) 
 
--------------����Ʒ��----------------------------------
 GO
IF OBJECT_ID('Product_Table') IS NOT NULL
   DROP TABLE Product_Table
GO
 CREATE TABLE Product_Table
 (
	P_id int IDENTITY(0,1) PRIMARY KEY,		--��Ʒ���
	P_No NvarChar(20),						--�Զ����Ʒ���
	P_Name NvarChar(100),					--��Ʒ����
	P_Price MONEY,							--��Ʒ�۸�
	PT_id INT DEFAULT(0),					--����
	HP_id INT DEFAULT(0),					--�Ƿ�����
	NP_id INT DEFAULT(1),					--�Ƿ���Ʒ
	P_Date DateTIME DEFAULT(Convert(datetime,getdate(),120)),--��������
	P_Company Nvarchar(200) DEFAULT('e�ϿƼ�') ,--��Ʒ��˾
	E_id INT								--������
 )
 
--------------���Ƿ����Ų�Ʒ��----------------------------------
 GO
IF OBJECT_ID('HotProduct_Table') IS NOT NULL
   DROP TABLE HotProduct_Table
GO
 CREATE TABLE HotProduct_Table
 (
	HP_id int IDENTITY(0,1) PRIMARY KEY,	--���ű��
	HP_Name NvarChar(50),					--�Ƿ�����
 )
 
--------------���Ƿ��²�Ʒ��----------------------------------
  GO
IF OBJECT_ID('NewProduct_Table') IS NOT NULL
   DROP TABLE NewProduct_Table
GO
 CREATE TABLE NewProduct_Table
 (
	NP_id int IDENTITY(0,1) PRIMARY KEY,--��Ʒ���
	NP_Name NvarChar(50),				--�Ƿ���Ʒ
 )
 
--------------����Ʒ���ͱ�----------------------------------
  GO
IF OBJECT_ID('ProductType_Table') IS NOT NULL
   DROP TABLE ProductType_Table
GO
 CREATE TABLE ProductType_Table
 (
	PT_id int IDENTITY(0,1) PRIMARY KEY,--���ͱ��
	PT_Name NvarChar(50),				--��������
 )
 
--------------����Ʒ���������----------------------------------
  GO
IF OBJECT_ID('ProductTryOur_Table') IS NOT NULL
   DROP TABLE ProductTryOur_Table
GO
 CREATE TABLE ProductTryOur_Table
 (
	PTO_id Int IDENTITY(0,1) primary KEY,  --���
	PTO_Name NvarChar(50),  --��˾����
	U_id INT ,  --������
	PTO_ApplyFor DATE,  --��������
	TO_id INT ,	--���״̬
	E_id INT ,  --�����ˣ�����Ա��
	PTO_AuditDate Datetime,	--����ʱ��
	PTO_Activate INT default(0),  --�Ƿ񼤻�
	PTO_ExpireDate Datetime,   --����ʱ��
	PTO_Remark NvarChar(200)  --��ע 
 )
 
--------------���������״̬��----------------------------------
  GO
IF OBJECT_ID('TryOut_Table') IS NOT NULL
   DROP TABLE TryOut_Table
GO
 CREATE TABLE TryOut_Table
 (
	TO_id int IDENTITY(0,1) PRIMARY KEY,--״̬���
	TO_Name NvarChar(50),				--״̬����
 )
 
 --------------���û���----------------------------------
  GO
IF OBJECT_ID('User_Table') IS NOT NULL
   DROP TABLE User_Table
GO
 CREATE TABLE User_Table
 (
	U_id int IDENTITY(0,1) PRIMARY KEY,		--���
	U_UserName NVARCHAR(16) ,				--�û���
	U_UserPwd NVARCHAR(16) ,				--����
	U_Head image ,							--ͷ��
	U_Name NVARCHAR(50) ,					--����
	U_Sex NVARCHAR(4) ,						--�Ա�
	IDT_id Int ,							--֤������
	U_IDS NVARCHAR(18) ,					--֤������
	U_Phone NVARCHAR(11) ,					--�ֻ�����
	M_id INT ,								--����
	U_Company NVARCHAR(300) ,				--���ڹ�˾
	U_ComPanyAddress NVARCHAR(300) ,		--��˾��ַ
	LS_id INT ,								--��¼״̬
	U_LoginAddress NVARCHAR(300) ,			--��¼��ַ
	U_LoginDatetime DateTime,				--��¼ʱ��
	U_LastLoginAddress NVARCHAR(300) ,		--�ϴε�¼��ַ
	U_LastLoginDatetime DateTime ,			--�ϴε�¼ʱ��
	U_CreateUserDate DateTime default(getdate())	--��������
	
 )
 
 --------------�������----------------------------------
  GO
IF OBJECT_ID('Mail_Table') IS NOT NULL
   DROP TABLE Mail_Table
GO
 CREATE TABLE Mail_Table
 (
	M_id int IDENTITY(0,1) PRIMARY KEY,		--���
	M_Mail NVARCHAR(16) ,					--�����
	M_YesNo NvarChar(4)						--�Ƿ񼤻�
 )
 
--------------����¼״̬��----------------------------------
  GO
IF OBJECT_ID('LoginState_Table') IS NOT NULL
   DROP TABLE LoginState_Table
GO
 CREATE TABLE LoginState_Table
 (
	LS_id int IDENTITY(0,1) PRIMARY KEY,		--��¼״̬���
	LS_Name NVARCHAR(50) ,					--��¼״̬����
 )
 
--------------��֤�����ͱ�----------------------------------
  GO
IF OBJECT_ID('IDType_Table') IS NOT NULL
   DROP TABLE IDType_Table
GO
 CREATE TABLE IDType_Table
 (
	IDT_id int IDENTITY(0,1) PRIMARY KEY,	--���
	IDT_Name NVARCHAR(50) ,					--֤������
 )
 
--------------���ܱ���----------------------------------
  GO
IF OBJECT_ID('IssueAnswer_Table') IS NOT NULL
   DROP TABLE IssueAnswer_Table
GO
 CREATE TABLE IssueAnswer_Table
 (
	IA_id int IDENTITY(0,1) PRIMARY KEY,	--���
	U_UserName NVARCHAR(16) ,				--�û��˺�
	IA_Issue1 NVARCHAR(300) ,				--����1
	IA_Issue2 NVARCHAR(300) ,				--����2
	IA_Issue3 NVARCHAR(300) ,				--����3
	IA_Answer1 NVARCHAR(300) ,				--��1
	IA_Answer2 NVARCHAR(300) ,				--��2
	IA_Answer3 NVARCHAR(300) ,				--��3
 )
 
 --------------�����ű�----------------------------------
  GO
IF OBJECT_ID('News_Table') IS NOT NULL
   DROP TABLE News_Table
GO
 CREATE TABLE News_Table
 (
	News_id int IDENTITY(0,1) PRIMARY KEY,	--���
	News_Name NVARCHAR(16) ,				--���ű���
	News_Content NVARCHAR(300) ,			--��������
	News_Anthor NVARCHAR(300) ,				--��������
	News_Date NVARCHAR(300) 				--����ʱ��
 )

 --------------��Ա����----------------------------------
  GO
IF OBJECT_ID('Employee_Table') IS NOT NULL
   DROP TABLE Employee_Table
GO
 CREATE TABLE Employee_Table
 (
	E_id int IDENTITY(0,1) PRIMARY KEY,	--���
	E_UserName NVARCHAR(16) ,			--�û���
	E_UserPwd NVARCHAR(16) ,			--����
	E_Name NVARCHAR(50) ,				--����
	E_Sex NVARCHAR(8), 					--�Ա�
	IDT_id Int, 						--֤������
	E_IdS NVARCHAR(18), 				--֤����
	E_School NVARCHAR(100), 			--��ҵѧУ
	E_Education NVARCHAR(8), 			--ѧ��
	E_Phone NVARCHAR(11), 				--��ϵ��ʽ
	E_Address NVARCHAR(200),			--��ͥסַ
	Dep_id INT, 						--����
	Post_id INT, 						--ְλ
	E_Pay money,						--н��
	LS_ID INT, 							--��¼״̬
	E_LoginAddress NVARCHAR(200), 		--��¼��ַ
	E_LoginDate DATETIME, 				--��¼ʱ��
	E_LastLoginAddress NVARCHAR(200), 	--�ϴε�¼��ַ
	E_LastLoginDate DATETIME, 			--�ϴε�¼ʱ��
	E_Date DATETIME						--ע��ʱ��
 )
  --------------�����ű�----------------------------------
  GO
IF OBJECT_ID('Department_Table') IS NOT NULL
   DROP TABLE Department_Table
GO
 CREATE TABLE Department_Table
 (
	Dep_id int IDENTITY(0,1) PRIMARY KEY,	--���
	Dep_Name NVARCHAR(50) 					--����
 )
 
   --------------��ְλ��----------------------------------
  GO
IF OBJECT_ID('Post_Table') IS NOT NULL
   DROP TABLE Post_Table
GO
 CREATE TABLE Post_Table
 (
	Post_id int IDENTITY(0,1) PRIMARY KEY,	--���
	Post_Name NVARCHAR(50) 				--����
 )

 --------------����Ƹ��----------------------------------
  GO
IF OBJECT_ID('JoinUs_Table') IS NOT NULL
   DROP TABLE JoinUs_Table
GO
 CREATE TABLE JoinUs_Table
 (
	JU_id int IDENTITY(0,1) PRIMARY KEY,	--���
	JU_Name NVARCHAR(50) ,					--�û���
	JU_Sex NVARCHAR(8) ,					--�Ա�
	JU_Phone NVARCHAR(11) ,					--��ϵ��ʽ
	JU_Address NVARCHAR(200), 				--��ַ
	JUP_id Int, 							--��Ƹ��λ
	JU_SubmitDateTime DateTime 				--�ύʱ��
 )

 --------------����Ƹ��λ��----------------------------------
  GO
IF OBJECT_ID('JoinUsPost_Table') IS NOT NULL
   DROP TABLE JoinUsPost_Table
GO
 CREATE TABLE JoinUsPost_Table
 (
	JUP_id int IDENTITY(0,1) PRIMARY KEY,	--���
	JUP_Name NVARCHAR(50) ,					--��λ����
	JUP_Number Int							--��Ƹ����
 )

 --------------�����۱�----------------------------------
  GO
IF OBJECT_ID('Evaluate_Table') IS NOT NULL
   DROP TABLE Evaluate_Table
GO
 CREATE TABLE Evaluate_Table
 (
	Eva_id int IDENTITY(0,1) PRIMARY KEY,	--���
	U_id Int ,								--�û�ID
	P_id Int,								--��ƷID
	Eva_Content NVARCHAR(200) ,				--��������
	Eva_Datetime DateTime					--ʱ��
 )

 --------------��������----------------------------------
  GO
IF OBJECT_ID('Feedback_Table') IS NOT NULL
   DROP TABLE Feedback_Table
GO
 CREATE TABLE Feedback_Table
 (
	Feed_id int IDENTITY(0,1) PRIMARY KEY,	--���
	U_id Int ,								--�û�ID
	P_id Int ,								--��ƷID
	Feed_Content NVARCHAR(200) ,			--��������
	Feed_Datetime DateTime 					--ʱ��
 )

 --------------�����������----------------------------------
  GO
IF OBJECT_ID('Solution_Table') IS NOT NULL
   DROP TABLE Solution_Table
GO
 CREATE TABLE Solution_Table
 (
	S_id int IDENTITY(0,1) PRIMARY KEY,		--���
	P_id INT ,								--��ƷID
	S_tatle NVARCHAR(20) ,					--����
	S_Content NVARCHAR(800) ,				--����
	S_Datetime DateTime 					--ʱ��
 )

 --------------����˾��Ϣ��----------------------------------
  GO
IF OBJECT_ID('Company_Table') IS NOT NULL
   DROP TABLE Company_Table
GO
 CREATE TABLE Company_Table
 (
	Com_id int IDENTITY(0,1) PRIMARY KEY,		--���
	Com_Name NVARCHAR(200) ,					--����
	Com_Logo image ,							--Logo
	Com_Introduce NVARCHAR(200) ,				--����
	Com_Honer NVARCHAR(200), 					--����
	Com_Scope NVARCHAR(200),					--���۷�Χ
	Com_Scale NVARCHAR(200), 					--��ģ
	Com_Course NVARCHAR(200), 					--��չ����
	Com_Purpose NVARCHAR(200) 					--��ּ
 )

 