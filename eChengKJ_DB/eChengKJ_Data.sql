USE eChengKJ_DB

/*
	Ϊ��֤���ݵ���Ч����ά���ķ����ԣ����̶��������������
*/



----------������״̬��---------------------
--EXEC Insert_OrderStateTable 'δ���' 
--EXEC Insert_OrderStateTable '�����'
--EXEC Insert_OrderStateTable '���ڴ���'

--EXEC Select_OrderStateTable

----------���Ƿ����Ų�Ʒ��---------------------
--EXEC Insert_HotProductTable '��'
--EXEC Insert_HotProductTable '��'

--EXEC Select_HotProductTable

----------���Ƿ��²�Ʒ��---------------------
--EXEC Insert_NewProductTable '��'
--EXEC Insert_NewProductTable '��'

--EXEC Select_NewProductTable

----------����Ʒ���ͱ�---------------------
--EXEC Insert_ProductTypeTable '��������'
--EXEC Insert_ProductTypeTable '��װ'
--EXEC Insert_ProductTypeTable '����'
--EXEC Insert_ProductTypeTable '�Ƶ�'
--EXEC Insert_ProductTypeTable '��˾'

--EXEC Select_ProductTypeTable

----------���������״̬��---------------------
--EXEC Insert_TryOutTable 'δ���'
--EXEC Insert_TryOutTable 'δͨ��'
--EXEC Insert_TryOutTable 'ͨ��'
--EXEC Insert_TryOutTable '�������'

--EXEC Select_TryOutTable

----------����¼״̬��---------------------
--EXEC Insert_LoginStateTable 'δ��½'
--EXEC Insert_LoginStateTable '���ڵ�½'

--EXEC Select_LoginStateTable

----------��֤�����ͱ�---------------------
--EXEC Insert_IDTypeTable '���֤'
--EXEC Insert_IDTypeTable '����'

--EXEC Select_IDTypeTable

----------�����ű�---------------------
--EXEC Insert_DepartmentTable '�߼�����'
--EXEC Insert_DepartmentTable '������'
--EXEC Insert_DepartmentTable 'ҵ��'
--EXEC Insert_DepartmentTable '���²�'
--EXEC Insert_DepartmentTable '������'

--EXEC Select_DepartmentTable

----------��ְλ��---------------------
--EXEC Insert_PostTable '���³�'
--EXEC Insert_PostTable '����'
--EXEC Insert_PostTable '�ܾ���'
--EXEC Insert_PostTable '����'
--EXEC Insert_PostTable '�ܼ�'
--EXEC Insert_PostTable '����'
--EXEC Insert_PostTable 'Ա��'

--EXEC Select_PostTable


------------���û���---------------------
--�û��������롢ͷ���������Ա�֤�����͡�֤���š��ֻ����롢���䡢���ڹ�˾����˾��ַ����¼״̬����¼��ַ����¼ʱ�䡢�ϴε�¼ʱ�䡢�ϴε�¼�ص㡢��������

Insert into User_Table
values('User01','User01','Logo_ICO.png','�˰���','Ů','0','341000199101296948','12345678901','','e�ϿƼ�','�㶫�麣�Ϸ��Ƽ�·123��','0','','','','',default)

Insert into User_Table
values('User02','User02','Logo_ICO.png','����÷','Ů','0','341000199101296948','12345678901','','e�ϿƼ�','�㶫�麣�Ϸ��Ƽ�·123��','0','','','','',default)

Insert into User_Table
values('User03','User03','Logo_ICO.png','����һ','��','0','341000199101296948','12345678901','','e�ϿƼ�','�㶫�麣�Ϸ��Ƽ�·123��','0','','','','',default)

EXEC Select_UserTable

------------��Ա����---------------------
--�û��������롢�������Ա�֤�����͡�֤���š���ҵѧУ��ѧ������ϵ��ʽ����ͥסַ�����š�ְλ�����ʡ���¼״̬����¼��ַ����¼ʱ�䡢�ϴε�¼ʱ�䡢�ϴε�¼�ص㡢ע��ʱ��
Insert into Employee_Table
values('Admin1','Admin1','������','��','0','440705198011202491','���ϴ�ѧ','����','12345678901','�㶫�麣�������·123��','3','6','4000','0','','','','',CONVERT(datetime, GETDATE(),120))

Insert into Employee_Table
values('Admin2','Admin2','��ʥ��','��','0','350924198906261917','���ϴ�ѧ','ר��','12345678901','�㶫�麣�������·124��','2','6','4000','0','','','','',CONVERT(datetime, GETDATE(),120))

Insert into Employee_Table
values('Admin3','Admin3','�����','Ů','0','34022219860802956X','���ϴ�ѧ','����','12345678901','�㶫�麣�������·125��','1','6','5000','0','','','','',CONVERT(datetime, GETDATE(),120))

EXEC Select_EmployeeTable

EXEC Select_DepartmentTable
EXEC Select_PostTable

------------����Ʒ��---------------------
--���ơ��۸񡢲�Ʒ���͡��Ƿ����Ų�Ʒ���Ƿ��²�Ʒ���������ڡ���Ʒ��˾��¼����Ա
Insert into Product_Table
values('00000001','e������','8888','0',default,default,default,default,1)

Insert into Product_Table
values('10000001','e���ǹ�','9999','1',default,default,default,default,1)

Insert into Product_Table
values('40000001','This��Դ','11111','4',default,default,default,default,1)

EXEC Select_ProductTable
EXEC Select_ProductTypeTable



------------��e�ϿƼ���Ϣ��---------------------
--��˾���ơ���˾Logo����˾���ܡ���˾��������˾��Χ���ܡ���˾��ģ����˾��չ���̡���˾��ּ
Insert into Company_Table
values('e�ϿƼ�','','e�ϿƼ���2017�´�һ��Ǳ�����޵ĺ���Ƽ���˾��ר�ŷ�����ҵ��Դ����',
'','���и�ҵERPϵͳ','2017������Ϊ1��','2017�괴��','����������չ������Ҫ��һ��Ч��ҲҪ��һ��')

EXEC Select_CompanyTable







