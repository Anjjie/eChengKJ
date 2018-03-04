using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Runtime.Serialization.Json;
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// All_Powerful_GetBLL 的摘要说明
    /// </summary>
    public class All_Powerful_GetBLL : IHttpHandler
    {
        //获取执行操作类型
        string methodType;//方法类型(执行某类中的方法)
        string classType;//类名类型（执行某类的名称）

        #region 所有BLL中的类进行实例化
        CompanyTable_BLL comBLL = new CompanyTable_BLL();
        DepartmentTable_BLL depBLL = new DepartmentTable_BLL();
        EmployeeTable_BLL empBLL = new EmployeeTable_BLL();
        EvaluateTable_BLL evaBLL = new EvaluateTable_BLL();
        FeedbackTable_BLL feeBLL = new FeedbackTable_BLL();
        HotProductTable_BLL hotBLL = new HotProductTable_BLL();
        IDTypeTable_BLL idtypeBLL = new IDTypeTable_BLL();
        IssueAnswerTable_BLL issBLL = new IssueAnswerTable_BLL();
        JoinUsPostTable_BLL joinPostBLL = new JoinUsPostTable_BLL();
        JoinUsTable_BLL joinBLL = new JoinUsTable_BLL();
        LoginStateTable_BLL loginBLL = new LoginStateTable_BLL();
        MailTable_BLL mailBLL = new MailTable_BLL();
        NewProductTable_BLL newProBLL = new NewProductTable_BLL();
        NewsTable_BLL newsBLL = new NewsTable_BLL();
        OrderStateTable_BLL orderStateBLL = new OrderStateTable_BLL();
        OrderTable_BLL orderBLL = new OrderTable_BLL();
        PostTable_BLL postBLL = new PostTable_BLL();
        ProductTable_BLL proBLL = new ProductTable_BLL();
        ProductTryOurTable_BLL ptotBLL = new ProductTryOurTable_BLL();
        ProductTypeTable_BLL prottBLL = new ProductTypeTable_BLL();
        SolutionTable_BLL solBLL = new SolutionTable_BLL();
        TryOutTable_BLL tryOTBLL = new TryOutTable_BLL();
        UserTable_BLL userBLL = new UserTable_BLL(); 
        #endregion

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            methodType=context.Request["methodType"];
            classType = context.Request["classType"];
            if (methodType.ToLower() == "selectcon")
            {
                //条件查询
                string attribute = context.Request["attribute"];
                string con = context.Request["con"];
                GetAll_SelectCon(context, classType, attribute, con);
            }
            else
            {
                //默认的 增 删 改 查
                GetAll_Method(context, methodType, classType);
            }
        }

        #region 获取客户端传过来的数据
        /// <summary>
        /// 获取客户端传过来的数据
        /// </summary>
        /// <returns></returns>
        public Object GetClientData(HttpContext context, string classTypes)
        {
            Object obj = new object();
            string id = context.Request["Id"];
            switch (classTypes.ToLower())
            {
                case "company":
                    Company_Table company = new Company_Table() {
                        Com_Course = context.Request["Course"],
                        Com_Honer = context.Request["Honer"],
                        Com_id = Convert.ToInt32( context.Request["Id"]),
                        Com_Introduce = context.Request["Introduce"],
                        Com_Name = context.Request["Name"],
                        Com_Purpose = context.Request["Purpose"],
                        Com_Scale = context.Request["Scale"],
                        Com_Scope = context.Request["Scope"]
                    };
                    obj = company;
                    break;
                case "department":
                    Department_Table department = new Department_Table() {
                        Dep_id = Convert.ToInt32(context.Request["Id"]),
                        Dep_Name = context.Request["Course"],
                    };
                    obj = department;
                    break;
                case "employee":
                    Employee_Table employee = new Employee_Table() {
                        E_id = Convert.ToInt32(context.Request["Id"]),
                        E_Address = context.Request["Address"],
                        E_IdS = context.Request["IdS"],
                        E_School = context.Request["School"],
                        E_Sex = context.Request["Sex"],
                        E_UserName = context.Request["UserName"],
                        E_Phone = context.Request["Phone"],
                        E_Pay = Convert.ToDouble(context.Request["Pay"]),
                        E_UserPwd = context.Request["UserPwd"],
                        E_Education = context.Request["Education"],
                        Dep_id = Convert.ToInt32(context.Request["depId"]),
                        E_Name = context.Request["Name"],
                        IDT_id = Convert.ToInt32(context.Request["idtid"]),
                        LS_ID = Convert.ToInt32(context.Request["lsID"]),
                        Post_id = Convert.ToInt32(context.Request["postId"]),
                        E_LastLoginDate =Convert.ToDateTime( context.Request["LoginDate"]),
                        E_LastLoginAddress= context.Request["LoginAddress"]
                    };
                    obj = employee;
                    break;
                case "evaluate":
                    Evaluate_Table evaluate = new Evaluate_Table() {
                        Eva_Content= context.Request["Content"],
                        Eva_id  =Convert.ToInt32(context.Request["Id"]),
                        P_id = Convert.ToInt32(context.Request["pId"]),
                        U_id = Convert.ToInt32(context.Request["uId"])
                    };
                    obj = evaluate;
                    break;
                case "feedback":
                    Feedback_Table feedback = new Feedback_Table() {
                        Feed_Content = context.Request["Content"],
                        Feed_id = Convert.ToInt32(context.Request["Id"]),
                        P_id = Convert.ToInt32(context.Request["pId"]),
                        U_id = Convert.ToInt32(context.Request["uId"])
                    };
                    obj = feedback;
                    break;
                case "hotproduct":
                    HotProduct_Table hotproduct = new HotProduct_Table() {
                        HP_id = Convert.ToInt32(context.Request["Id"]),
                        HP_Name = context.Request["Name"]
                    };
                    obj = hotproduct;
                    break;
                case "idtype":
                    IDType_Table idtype = new IDType_Table() {
                        IDT_id = Convert.ToInt32(context.Request["Id"]),
                        IDT_Name = context.Request["Name"]
                    };
                    obj = idtype;
                    break;
                case "issueanswer":
                    IssueAnswer_Table issueanswer = new IssueAnswer_Table() {
                        IA_id = Convert.ToInt32(context.Request["Id"]),
                        U_UserName = context.Request["UserName"],
                        IA_Answer1 = context.Request["Answer1"],
                        IA_Answer2 = context.Request["Answer2"],
                        IA_Answer3 = context.Request["Answer3"],
                        IA_Issue1 = context.Request["Issue1"],
                        IA_Issue2 = context.Request["Issue2"],
                        IA_Issue3 = context.Request["Issue3"]
                    };
                    obj = issueanswer;
                    break;
                case "joinus":
                    JoinUs_Table joinus = new JoinUs_Table() {
                        JUP_id =Convert.ToInt32( context.Request["jupId"]),
                        JU_Sex= context.Request["Sex"],
                        JU_id = Convert.ToInt32(context.Request["Id"]),
                        JU_Address = context.Request["Address"],
                        JU_Name = context.Request["Name"],
                        JU_Phone = context.Request["Phone"]
                    };
                    obj = joinus;
                    break;
                case "joinuspost":
                    JoinUsPost_Table joinuspost = new JoinUsPost_Table() {
                        JUP_id= Convert.ToInt32(context.Request["Id"]),
                        JUP_Name = context.Request["Name"],
                        JUP_Number = Convert.ToInt32(context.Request["Number"])
                    };
                    obj = joinuspost;
                    break;
                case "loginstate":
                    LoginState_Table loginstate = new LoginState_Table() {
                        LS_id= Convert.ToInt32(context.Request["Id"]),
                        LS_Name= context.Request["Name"],
                    };
                    obj = loginstate;
                    break;
                case "mail":
                    Mail_Table mail = new Mail_Table() {
                        M_id= Convert.ToInt32(context.Request["Id"]),
                        M_Mail= context.Request["Mail"],
                        M_YesNo = context.Request["YesNo"],
                    };
                    obj = mail;
                    break;
                case "newproduct":
                    NewProduct_Table newproduct = new NewProduct_Table() {
                        NP_id= Convert.ToInt32(context.Request["Id"]),
                        NP_Name = context.Request["Name"],
                    };
                    obj = newproduct;
                    break;
                case "news":
                    News_Table news = new News_Table() {
                        News_Anthor = context.Request["Anthor"],
                        News_Content = context.Request["Content"],
                        News_id = Convert.ToInt32(context.Request["Id"]),
                        News_Name = context.Request["Name"],
                    };
                    obj = news;
                    break;
                case "order":
                    Order_Table order = new Order_Table() {
                        E_id= Convert.ToInt32(context.Request["eId"]),
                        OState_id = Convert.ToInt32(context.Request["ostateId"]),
                        O_id = Convert.ToInt32(context.Request["Id"]),
                        P_id = Convert.ToInt32(context.Request["pId"]),
                        U_id = Convert.ToInt32(context.Request["uId"]),
                        O_DealWay = context.Request["DealWay"],
                        O_LeaveWords = context.Request["LeaveWords"],
                        O_Remark = context.Request["Remark"]
                    };
                    obj = order;
                    break;
                case "orderstate":
                    OrderState_Table orderstate = new OrderState_Table() {
                        OState_id = Convert.ToInt32(context.Request["Id"]),
                        OState_Name= context.Request["Name"]
                    };
                    obj = orderstate;
                    break;
                case "post":
                    Post_Table post = new Post_Table() {
                        Post_id = Convert.ToInt32(context.Request["Id"]),
                        Post_Name = context.Request["Name"]
                    };
                    obj = post;
                    break;
                case "product":
                    Product_Table product = new Product_Table() {
                        E_id = Convert.ToInt32(context.Request["eId"]),
                        HP_id = Convert.ToInt32(context.Request["hpId"]),
                        NP_id = Convert.ToInt32(context.Request["npId"]),
                        PT_id = Convert.ToInt32(context.Request["ptId"]),
                        P_id = Convert.ToInt32(context.Request["Id"]),
                        P_Company = context.Request["Company"],
                        P_Name = context.Request["Name"],
                        P_No = context.Request["No"],
                        P_Price =Convert.ToDouble( context.Request["Price"])
                    };
                    obj = product;
                    break;
                case "producttryour":
                    ProductTryOur_Table producttryour = new ProductTryOur_Table() {
                        E_id= Convert.ToInt32(context.Request["eId"]),
                        PTO_id= Convert.ToInt32(context.Request["Id"]),
                        TO_id= Convert.ToInt32(context.Request["toId"]),
                        U_id= Convert.ToInt32(context.Request["uId"]),
                        PTO_Name = context.Request["Name"],
                        PTO_Remark = context.Request["Remark"]
                    };
                    obj = producttryour;
                    break;
                case "producttype":
                    ProductType_Table producttype = new ProductType_Table() {
                        PT_id = Convert.ToInt32(context.Request["Id"]),
                        PT_Name =context.Request["Name"]
                    };
                    obj = producttype;
                    break;
                case "solution":
                    Solution_Table solution = new Solution_Table() {
                        P_id= Convert.ToInt32(context.Request["pId"]),
                        S_id= Convert.ToInt32(context.Request["Id"]),
                        S_Content= context.Request["Content"],
                        S_tatle= context.Request["Tatle"],
                    };
                    obj = solution;
                    break;
                case "tryout":
                    TryOut_Table tryout = new TryOut_Table() {
                        TO_id= Convert.ToInt32(context.Request["Id"]),
                        TO_Name= context.Request["Name"]
                    };
                    obj = tryout;
                    break;
                case "user":
                    User_Table user = new User_Table() {
                        IDT_id= Convert.ToInt32(context.Request["idtId"]),
                        LS_id= Convert.ToInt32(context.Request["lsId"]),
                        M_id = Convert.ToInt32(context.Request["mId"]),
                        U_id = Convert.ToInt32(context.Request["Id"]),
                        U_Company= context.Request["Company"],
                        U_ComPanyAddress = context.Request["ComPanyAddress"],
                        U_Head = context.Request["Head"],
                        U_IDS = context.Request["IDS"],
                        U_Phone = context.Request["Phone"],
                        U_Name = context.Request["Name"],
                        U_PhoneVerify = context.Request["PhoneVerify"],
                        U_Sex = context.Request["Sex"],
                        U_UserName = context.Request["UserName"],
                        U_UserPwd = context.Request["UserPwd"],
                        U_LastLoginDatetime = context.Request["LoginDatetime"],
                        U_LastLoginAddress = context.Request["LoginAddress"],
                        U_CreateUserDate= context.Request["CreateUserDate"]
                    };
                    obj = user;
                    break;
            }
            return obj;
        } 
        #endregion

        #region 获取方法及返回数据
        /// <summary>
        /// 获取方法及返回数据
        /// </summary>
        /// <param name="http"></param>
        /// <param name="methodTypes">执行某类中的方法(如：Insert/Update/Delete/SelectAll/SelectCon) 括号选其一</param>
        /// <param name="classTypes">执行某类的名称(如：用户类就写 User)</param>
        public void GetAll_Method(HttpContext context, string methodTypes, string classTypes)
        {
            Object obj = GetClientData(context,classTypes);
            switch (methodType.ToLower())
            {
                //所有添加方法
                case "insert":
                    context.Response.Write(GetAll_Insert(classTypes, obj));
                    break;
                //所有修改方法
                case "update":
                    context.Response.Write(GetAll_Update(classTypes, obj));
                    break;
                //所有删除方法
                case "delete":
                    context.Response.Write(GetAll_Delect(classTypes, obj));
                    break;
                //所有查询全部方法
                case "selectall":
                    GetAll_SelectAll(context,classTypes);
                    break;
                //报错：选项输入错误
                default:
                    break;
            }
        } 
        #endregion

        #region 获取全部类中的添加方法
        /// <summary>
        /// 获取全部类中的添加方法
        /// </summary>
        /// <param name="classTypes"></param>
        public string GetAll_Insert(string classTypes, object obj)
        {
            int n = 0;
            switch (classTypes.ToLower())
            {
                case "company":
                    Company_Table company = obj as Company_Table;
                    n = comBLL.Insert_CompanyTableData(company);
                    break;
                case "department":
                    Department_Table department = obj as Department_Table;
                    n = depBLL.Insert_DepartmentTableData(department);
                    break;
                case "employee":
                    Employee_Table employee = obj as Employee_Table;
                    employee.E_Date = DateTime.Now;
                    employee.E_LastLoginAddress = "";
                    employee.E_LoginAddress = "";
                    employee.E_LoginDate = Convert.ToDateTime("1-1-1 00:00:00.000");
                    employee.E_LastLoginDate = Convert.ToDateTime("1-1-1 00:00:00.000");
                    employee.E_Date = DateTime.Now;
                    n = empBLL.Insert_EmployeeTableData(employee);
                    break;
                case "evaluate":
                    Evaluate_Table evaluate = obj as Evaluate_Table;
                    evaluate.Eva_Datetime = DateTime.Now;
                    n = evaBLL.Insert_EvaluateTableData(evaluate);
                    break;
                case "feedback":
                    Feedback_Table feedback = obj as Feedback_Table;
                    feedback.Feed_Datetime = DateTime.Now;
                    n = feeBLL.Insert_FeedbackTableData(feedback);
                    break;
                case "hotproduct":
                    HotProduct_Table hotproduct = obj as HotProduct_Table;
                    n = hotBLL.Insert_HotProductTableData(hotproduct);
                    break;
                case "idtype":
                    IDType_Table idtype = obj as IDType_Table;
                    n = idtypeBLL.Insert_IDTypeTableData(idtype);
                    break;
                case "issueanswer":
                    IssueAnswer_Table issueanswer = obj as IssueAnswer_Table;
                    n =issBLL.Insert_IssueAnswerTableData(issueanswer);
                    break;
                case "joinus":
                    JoinUs_Table joinus = obj as JoinUs_Table;
                    joinus.JU_SubmitDateTime = DateTime.Now;
                    n = joinBLL.Insert_JoinUsTableData(joinus);
                    break;
                case "joinuspost":
                    JoinUsPost_Table joinuspost = obj as JoinUsPost_Table;
                    n = joinPostBLL.Insert_JoinUsPostTableData(joinuspost);
                    break;
                case "loginstate":
                    LoginState_Table loginstate = obj as LoginState_Table;
                    n = loginBLL.Insert_LoginStateTableData(loginstate);
                    break;
                case "mail":
                    Mail_Table mail = obj as Mail_Table;
                    n = mailBLL.Insert_MailTableData(mail);
                    break;
                case "newproduct":
                    NewProduct_Table newproduct = obj as NewProduct_Table;
                    n = newProBLL.Insert_NewProductTableData(newproduct);
                    break;
                case "news":
                    News_Table news = obj as News_Table;
                    news.News_Date = DateTime.Now+"";
                    n = newsBLL.Insert_NewsTableData(news);
                    break;
                case "order":
                    Order_Table order = obj as Order_Table;
                    order.O_DateTime = DateTime.Now;
                    n = orderBLL.Insert_OrderTableData(order);
                    break;
                case "orderstate":
                    OrderState_Table orderstate = obj as OrderState_Table;
                    n = orderStateBLL.Insert_OrderStateTableData(orderstate);
                    break;
                case "post":
                    Post_Table post = obj as Post_Table;
                    n = postBLL.Insert_PostTableData(post);
                    break;
                case "product":
                    Product_Table product = obj as Product_Table;
                    product.P_Date = DateTime.Now;
                    n = proBLL.Insert_ProductTableData(product);
                    break;
                case "producttryour":
                    ProductTryOur_Table producttryour = obj as ProductTryOur_Table;
                    n = ptotBLL.Insert_ProductTryOurTableData(producttryour);
                    break;
                case "producttype":
                    ProductType_Table producttype = obj as ProductType_Table;
                    n = prottBLL.Insert_ProductTypeTableData(producttype);
                    break;
                case "solution":
                    Solution_Table solution = obj as Solution_Table;
                    solution.S_Datetime = DateTime.Now;
                    n = solBLL.Insert_SolutionTableData(solution);
                    break;
                case "tryout":
                    TryOut_Table tryout = obj as TryOut_Table;
                    n = tryOTBLL.Insert_TryOutTableData(tryout);
                    break;
                case "user":
                    User_Table user = obj as User_Table;
                    user.U_CreateUserDate = DateTime.Now+"";
                    user.U_LoginDatetime = "1-1-1 00:00:00.000"; 
                    user.U_LastLoginDatetime= "1-1-1 00:00:00.000";
                    user.U_LoginAddress = "";
                    user.U_LastLoginAddress = "";
                    n = userBLL.Insert_UserTableData(user);
                    break;
                default:
                    return "出错：你输入的类型中有误！";
            }
            if (n > 0)
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        } 
        #endregion

        #region 获取全部类中的修改方法
        /// <summary>
        /// 获取全部类中的修改方法
        /// </summary>
        /// <param name="classTypes"></param>
        public string GetAll_Update(string classTypes, object obj)
        {
            int n = 0;
            switch (classTypes.ToLower())
            {
                case "company":
                    Company_Table company = obj as Company_Table;
                    n = comBLL.Update_CompanyTableData(company);
                    break;
                case "department":
                    Department_Table department = obj as Department_Table;
                    n = depBLL.Update_DepartmentTableData(department);
                    break;
                case "employee":
                    Employee_Table employee = obj as Employee_Table;
                    employee.E_LoginAddress = "";
                    employee.E_LoginDate = DateTime.Now;
                    n = empBLL.Update_EmployeeTableData(employee);
                    break;
                case "evaluate":
                    Evaluate_Table evaluate = obj as Evaluate_Table;
                    n = evaBLL.Update_EvaluateTableData(evaluate);
                    break;
                case "feedback":
                    Feedback_Table feedback = obj as Feedback_Table;
                    n = feeBLL.Update_FeedbackTableData(feedback);
                    break;
                case "hotproduct":
                    HotProduct_Table hotproduct = obj as HotProduct_Table;
                    n = hotBLL.Update_HotProductTableData(hotproduct);
                    break;
                case "idtype":
                    IDType_Table idtype = obj as IDType_Table;
                    n = idtypeBLL.Update_IDTypeTableData(idtype);
                    break;
                case "issueanswer":
                    IssueAnswer_Table issueanswer = obj as IssueAnswer_Table;
                    n = issBLL.Update_IssueAnswerTableData(issueanswer);
                    break;
                case "joinus":
                    JoinUs_Table joinus = obj as JoinUs_Table;
                    n = joinBLL.Update_JoinUsTableData(joinus);
                    break;
                case "joinuspost":
                    JoinUsPost_Table joinuspost = obj as JoinUsPost_Table;
                    n = joinPostBLL.Update_JoinUsPostTableData(joinuspost);
                    break;
                case "loginstate":
                    LoginState_Table loginstate = obj as LoginState_Table;
                    n = loginBLL.Update_LoginStateTableData(loginstate);
                    break;
                case "mail":
                    Mail_Table mail = obj as Mail_Table;
                    n = mailBLL.Update_MailTableData(mail);
                    break;
                case "newproduct":
                    NewProduct_Table newproduct = obj as NewProduct_Table;
                    n = newProBLL.Update_NewProductTableData(newproduct);
                    break;
                case "news":
                    News_Table news = obj as News_Table;
                    n = newsBLL.Update_NewsTableData(news);
                    break;
                case "order":
                    Order_Table order = obj as Order_Table;
                    n = orderBLL.Update_OrderTableData(order);
                    break;
                case "orderstate":
                    OrderState_Table orderstate = obj as OrderState_Table;
                    n = orderStateBLL.Update_OrderStateTableData(orderstate);
                    break;
                case "post":
                    Post_Table post = obj as Post_Table;
                    n = postBLL.Update_PostTableData(post);
                    break;
                case "product":
                    Product_Table product = obj as Product_Table;
                    n = proBLL.Update_ProductTableData(product);
                    break;
                case "producttryour":
                    ProductTryOur_Table producttryour = obj as ProductTryOur_Table;
                    n = ptotBLL.Update_ProductTryOurTableData(producttryour);
                    break;
                case "producttype":
                    ProductType_Table producttype = obj as ProductType_Table;
                    n = prottBLL.Update_ProductTypeTableData(producttype);
                    break;
                case "solution":
                    Solution_Table solution = obj as Solution_Table;
                    n = solBLL.Update_SolutionTableData(solution);
                    break;
                case "tryout":
                    TryOut_Table tryout = obj as TryOut_Table;
                    n = tryOTBLL.Update_TryOutTableData(tryout);
                    break;
                case "user":
                    User_Table user = obj as User_Table;
                    user.U_LoginDatetime = DateTime.Now+"";
                    user.U_LoginAddress = "";
                    n = userBLL.Update_UserTableData(user);
                    break;
                default:
                    return "出错：你输入的类型中有误！";
            }
            if (n > 0)
            {
                return "Yes";
            }
            else
            {
                return "No";
            }

        } 
        #endregion

        #region 获取全部类中的删除方法
        /// <summary>
        /// 获取全部类中的删除方法
        /// </summary>
        /// <param name="classTypes"></param>
        public string GetAll_Delect(string classTypes, object obj)
        {
            int n = 0;
            switch (classTypes.ToLower())
            {
                case "company":
                    Company_Table company = obj as Company_Table;
                    n = comBLL.Delete_CompanyTableData(company.Com_id+"");
                    break;
                case "department":
                    Department_Table department = obj as Department_Table;
                    n = depBLL.Delete_DepartmentTableData (department.Dep_id+"");
                    break;
                case "employee":
                    Employee_Table employee = obj as Employee_Table;
                    n = empBLL.Delete_EmployeeTableData(employee.IDT_id+"");
                    break;
                case "evaluate":
                    Evaluate_Table evaluate = obj as Evaluate_Table;
                    n = evaBLL.Delete_EvaluateTableData(evaluate.Eva_id+"");
                    break;
                case "feedback":
                    Feedback_Table feedback = obj as Feedback_Table;
                    n = feeBLL.Delete_FeedbackTableData(feedback.Feed_id + "");
                    break;
                case "hotproduct":
                    HotProduct_Table hotproduct = obj as HotProduct_Table;
                    n = hotBLL.Delete_HotProductTableData(hotproduct.HP_id + "");
                    break;
                case "idtype":
                    IDType_Table idtype = obj as IDType_Table;
                    n = idtypeBLL.Delete_IDTypeTableData(idtype.IDT_id + "");
                    break;
                case "issueanswer":
                    IssueAnswer_Table issueanswer = obj as IssueAnswer_Table;
                    n = issBLL.Delete_IssueAnswerTableData(issueanswer.IA_id + "");
                    break;
                case "joinus":
                    JoinUs_Table joinus = obj as JoinUs_Table;
                    n = joinBLL.Delete_JoinUsTableData(joinus.JUP_id + "");
                    break;
                case "joinuspost":
                    JoinUsPost_Table joinuspost = obj as JoinUsPost_Table;
                    n = joinPostBLL.Delete_JoinUsPostTableData(joinuspost.JUP_id + "");
                    break;
                case "loginstate":
                    LoginState_Table loginstate = obj as LoginState_Table;
                    n = loginBLL.Delete_LoginStateTableData(loginstate.LS_id + "");
                    break;
                case "mail":
                    Mail_Table mail = obj as Mail_Table;
                    n = mailBLL.Delete_MailTableData(mail.M_id + "");
                    break;
                case "newproduct":
                    NewProduct_Table newproduct = obj as NewProduct_Table;
                    n = newProBLL.Delete_NewProductTableData(newproduct.NP_id + "");
                    break;
                case "news":
                    News_Table news = obj as News_Table;
                    n = newsBLL.Delete_NewsTableData(news.News_id + "");
                    break;
                case "order":
                    Order_Table order = obj as Order_Table;
                    n = orderBLL.Delete_OrderTableData(order.O_id + "");
                    break;
                case "orderstate":
                    OrderState_Table orderstate = obj as OrderState_Table;
                    n = orderStateBLL.Delete_OrderStateTableData(orderstate.OState_id + "");
                    break;
                case "post":
                    Post_Table post = obj as Post_Table;
                    n = postBLL.Delete_PostTableData(post.Post_id + "");
                    break;
                case "product":
                    Product_Table product = obj as Product_Table;
                    n = proBLL.Delete_ProductTableData(product.P_id + "");
                    break;
                case "producttryour":
                    ProductTryOur_Table producttryour = obj as ProductTryOur_Table;
                    n = ptotBLL.Delete_ProductTryOurTableData(producttryour.PTO_id + "");
                    break;
                case "producttype":
                    ProductType_Table producttype = obj as ProductType_Table;
                    n = prottBLL.Delete_ProductTypeTableData(producttype.PT_id + "");
                    break;
                case "solution":
                    Solution_Table solution = obj as Solution_Table;
                    n = solBLL.Delete_SolutionTableData(solution.S_id + "");
                    break;
                case "tryout":
                    TryOut_Table tryout = obj as TryOut_Table;
                    n = tryOTBLL.Delete_TryOutTableData(tryout.TO_id + "");
                    break;
                case "user":
                    User_Table user = obj as User_Table;
                    n = userBLL.Delete_UserTableData(user.U_id + "");
                    break;
                default:
                    return "出错：你输入的类型中有误！";
            }
            if (n > 0)
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
        #endregion

        #region 获取全部类中的查询全部数据方法
        /// <summary>
        /// 获取全部类中的查询全部数据方法
        /// </summary>
        /// <param name="classTypes"></param>
        public void GetAll_SelectAll(HttpContext context, string classTypes)
        {
            DataContractJsonSerializer dcjs;
            switch (classTypes.ToLower())
            {
                case "company":
                    List<Company_Table> list_company = comBLL.GetCompanyTableAll();
                     dcjs = new DataContractJsonSerializer(typeof(List<Company_Table>));
                     dcjs.WriteObject(context.Response.OutputStream, list_company);
                    break;
                case "department":
                    List<Department_Table> list_department = depBLL.GetDepartmentTableAll();
                     dcjs = new DataContractJsonSerializer(typeof(List<Department_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_department);
                    break;
                case "employee":
                    List<Employee_Table> list_employee = empBLL.GetEmployeeTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Employee_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_employee);
                    break;
                case "evaluate":
                    List<Evaluate_Table> list_evaluate = evaBLL.GetEvaluateTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Evaluate_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_evaluate);
                    break;
                case "feedback":
                    List<Feedback_Table> list_feedback = feeBLL.GetFeedbackTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Feedback_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_feedback);
                    break;
                case "hotproduct":
                    List<HotProduct_Table> list_hotproduct = hotBLL.GetHotProductTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<HotProduct_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_hotproduct);
                    break;
                case "idtype":
                    List<IDType_Table> list_idtype = idtypeBLL.GetIDTypeTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<IDType_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_idtype);
                    break;
                case "issueanswer":
                    List<IssueAnswer_Table> list_issueanswer = issBLL.GetIssueAnswerTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<IssueAnswer_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_issueanswer);
                    break;
                case "joinus":
                    List<JoinUs_Table> list_joinus = joinBLL.GetJoinUsTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<JoinUs_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_joinus);
                    break;
                case "joinuspost":
                    List<JoinUsPost_Table> list_joinuspost = joinPostBLL.GetJoinUsPostTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<JoinUsPost_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_joinuspost);
                    break;
                case "loginstate":
                    List<LoginState_Table> list_loginstate = loginBLL.GetLoginStateTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<LoginState_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_loginstate);
                    break;
                case "mail":
                    List<Mail_Table> list_mail = mailBLL.GetMailTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Mail_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_mail);
                    break;
                case "newproduct":
                    List<NewProduct_Table> list_newproduct = newProBLL.GetNewProductTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<NewProduct_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_newproduct);
                    break;
                case "news":
                    List<News_Table> list_news = newsBLL.GetNewsTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<News_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_news);
                    break;
                case "order":
                    List<Order_Table> list_order = orderBLL.GetOrderTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Order_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_order);
                    break;
                case "orderstate":
                    List<OrderState_Table> list_orderstate = orderStateBLL.GetOrderStateTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<OrderState_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_orderstate);
                    break;
                case "post":
                    List<Post_Table> list_post = postBLL.GetPostTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Post_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_post);
                    break;
                case "product":
                    List<Product_Table> list_product = proBLL.GetProductTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Product_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_product);
                    break;
                case "producttryour":
                    List<ProductTryOur_Table> list_producttryour = ptotBLL.GetProductTryOurTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<ProductTryOur_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_producttryour);
                    break;
                case "producttype":
                    List<ProductType_Table> list_producttype = prottBLL.GetProductTypeTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<ProductType_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_producttype);
                    break;
                case "solution":
                    List<Solution_Table> list_solution = solBLL.GetSolutionTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<Solution_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_solution);
                    break;
                case "tryout":
                    List<TryOut_Table> list_tryout = tryOTBLL.GetTryOutTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<TryOut_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_tryout);
                    break;
                case "user":
                    List<User_Table> list_user = userBLL.GetUserTableAll();
                    dcjs = new DataContractJsonSerializer(typeof(List<User_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_user);
                    break;
                default:
                    context.Response.Write("出错：你输入的类型中有误！");
                    break;
            }
        }
        #endregion

        #region 获取全部类中的按条件查询数据方法
        /// <summary>
        /// 获取全部类中的按条件查询数据方法
        /// </summary>
        /// <param name="context"></param>
        /// /// <param name="classTypes">按那个类名（表名）查询</param>
        /// <param name="attribute">按某个属性查询</param>
        /// <param name="con">查询的条件</param>
        public void GetAll_SelectCon(HttpContext context, string classTypes, string attribute, string con)
        {
            DataContractJsonSerializer dcjs;
            switch (classTypes.ToLower())
            {
                case "company":
                    Company_Table get_company = comBLL.GetCompanyTableByConn(con);
                    List<Company_Table> list_company = new List<Company_Table>();
                    list_company.Add(get_company);
                    dcjs = new DataContractJsonSerializer(typeof(List<Company_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_company);
                    break;
                case "department":
                    Department_Table get_department = depBLL.GetDepartmentTableByConn(con);
                    List<Department_Table> list_department = new List<Department_Table>();
                    list_department.Add(get_department);
                    dcjs = new DataContractJsonSerializer(typeof(List<Department_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_department);
                    break;
                case "employee":
                    Employee_Table get_employee = empBLL.GetEmployeeTableByConn(con);
                    List<Employee_Table> list_employee = new List<Employee_Table>();
                    list_employee.Add(get_employee);
                    dcjs = new DataContractJsonSerializer(typeof(List<Employee_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_employee);
                    break;
                case "evaluate":
                    Evaluate_Table get_evaluate = evaBLL.GetEvaluateTableByConn(con);
                    List<Evaluate_Table> list_evaluate = new List<Evaluate_Table>();
                    list_evaluate.Add(get_evaluate);
                    dcjs = new DataContractJsonSerializer(typeof(List<Evaluate_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_evaluate);
                    break;
                case "feedback":
                    Feedback_Table get_feedback = feeBLL.GetFeedbackTableByConn(con);
                    List<Feedback_Table> list_feedback = new List<Feedback_Table>();
                    list_feedback.Add(get_feedback);
                    dcjs = new DataContractJsonSerializer(typeof(List<Feedback_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_feedback);
                    break;
                case "hotproduct":
                    HotProduct_Table get_hotproduct = hotBLL.GetHotProductTableByConn(con);
                    List<HotProduct_Table> list_hotproduct = new List<HotProduct_Table>();
                    list_hotproduct.Add(get_hotproduct);
                    dcjs = new DataContractJsonSerializer(typeof(List<HotProduct_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_hotproduct);
                    break;
                case "idtype":
                    IDType_Table get_idtype = idtypeBLL.GetIDTypeTableByConn(con);
                    List<IDType_Table> list_idtype = new List<IDType_Table>();
                    list_idtype.Add(get_idtype);
                    dcjs = new DataContractJsonSerializer(typeof(List<IDType_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_idtype);
                    break;
                case "issueanswer":
                    IssueAnswer_Table get_issueanswer = issBLL.GetIssueAnswerTableByConn(con);
                    List<IssueAnswer_Table> list_issueanswer = new List<IssueAnswer_Table>();
                    list_issueanswer.Add(get_issueanswer);
                    dcjs = new DataContractJsonSerializer(typeof(List<IssueAnswer_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_issueanswer);
                    break;
                case "joinus":
                    JoinUs_Table get_joinus = joinBLL.GetJoinUsTableByConn(con);
                    List<JoinUs_Table> list_joinus = new List<JoinUs_Table>();
                    list_joinus.Add(get_joinus);
                    dcjs = new DataContractJsonSerializer(typeof(List<JoinUs_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_joinus);
                    break;
                case "joinuspost":
                    JoinUsPost_Table get_joinuspost = joinPostBLL.GetJoinUsPostTableByConn(con);
                    List<JoinUsPost_Table> list_joinuspost = new List<JoinUsPost_Table>();
                    list_joinuspost.Add(get_joinuspost);
                    dcjs = new DataContractJsonSerializer(typeof(List<JoinUsPost_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_joinuspost);
                    break;
                case "loginstate":
                    LoginState_Table get_loginstate = loginBLL.GetLoginStateTableByConn(con);
                    List<LoginState_Table> list_loginstate = new List<LoginState_Table>();
                    list_loginstate.Add(get_loginstate);
                    dcjs = new DataContractJsonSerializer(typeof(List<LoginState_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_loginstate);
                    break;
                case "mail":
                    Mail_Table get_mail = mailBLL.GetMailTableByConn(con);
                    List<Mail_Table> list_mail = new List<Mail_Table>();
                    list_mail.Add(get_mail);
                    dcjs = new DataContractJsonSerializer(typeof(List<Mail_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_mail);
                    break;
                case "newproduct":
                    NewProduct_Table get_newproduct = newProBLL.GetNewProductTableByConn(con);
                    List<NewProduct_Table> list_newproduct = new List<NewProduct_Table>();
                    list_newproduct.Add(get_newproduct);
                    dcjs = new DataContractJsonSerializer(typeof(List<NewProduct_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_newproduct);
                    break;
                case "news":
                    News_Table get_news = newsBLL.GetNewsTableByConn(con);
                    List<News_Table> list_news = new List<News_Table>();
                    list_news.Add(get_news);
                    dcjs = new DataContractJsonSerializer(typeof(List<News_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_news);
                    break;
                case "order":
                    List<Order_Table> list_order = orderBLL.GetOrderTableByConn(attribute,con);
                    dcjs = new DataContractJsonSerializer(typeof(List<Order_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_order);
                    break;
                case "orderstate":
                    OrderState_Table get_orderstate = orderStateBLL.GetOrderStateTableByConn(con);
                    List<OrderState_Table> list_orderstate = new List<OrderState_Table>();
                    list_orderstate.Add(get_orderstate);
                    dcjs = new DataContractJsonSerializer(typeof(List<OrderState_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_orderstate);
                    break;
                case "post":
                    Post_Table get_post = postBLL.GetPostTableByConn(con);
                    List<Post_Table> list_post = new List<Post_Table>();
                    list_post.Add(get_post);
                    dcjs = new DataContractJsonSerializer(typeof(List<Post_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_post);
                    break;
                case "product":
                    Product_Table get_product = proBLL.GetProductTableByConn("P_id", con);
                    List<Product_Table> list_product = new List<Product_Table>();
                    list_product.Add(get_product);
                    dcjs = new DataContractJsonSerializer(typeof(List<Product_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_product);
                    break;
                case "producttryour":
                    ProductTryOur_Table get_producttryour = ptotBLL.GetProductTryOurTableByConn(con);
                    List<ProductTryOur_Table> list_producttryour = new List<ProductTryOur_Table>();
                    list_producttryour.Add(get_producttryour);
                    dcjs = new DataContractJsonSerializer(typeof(List<ProductTryOur_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_producttryour);
                    break;
                case "producttype":
                    ProductType_Table get_producttype = prottBLL.GetProductTypeTableByConn(con);
                    List<ProductType_Table> list_producttype = new List<ProductType_Table>();
                    list_producttype.Add(get_producttype);
                    dcjs = new DataContractJsonSerializer(typeof(List<ProductType_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_producttype);
                    break;
                case "solution":
                    Solution_Table get_solution = solBLL.GetSolutionTableByConn(con);
                    List<Solution_Table> list_solution = new List<Solution_Table>();
                    list_solution.Add(get_solution);
                    dcjs = new DataContractJsonSerializer(typeof(List<Solution_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_solution);
                    break;
                case "tryout":
                    TryOut_Table get_tryout = tryOTBLL.GetTryOutTableByConn(con);
                    List<TryOut_Table> list_tryout = new List<TryOut_Table>();
                    list_tryout.Add(get_tryout);
                    dcjs = new DataContractJsonSerializer(typeof(List<TryOut_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_tryout);
                    break;
                case "user":
                    User_Table get_user = userBLL.GetUserTableByConn(con, attribute);
                    List<User_Table> list_user = new List<User_Table>();
                    list_user.Add(get_user);
                    dcjs = new DataContractJsonSerializer(typeof(List<User_Table>));
                    dcjs.WriteObject(context.Response.OutputStream, list_user);
                    break;
                default:
                    context.Response.Write("出错：你输入的类型中有误！");
                    break;
            }
        } 
        #endregion

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}