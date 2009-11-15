﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using DTCMS.Web.Utils;

namespace DTCMS.Web.admin.dtree
{
    public partial class Test : System.Web.UI.Page
    {
        private DataTable returnDT()
        {
            DataTable dtTes = new DataTable();
            dtTes.Columns.Add("ID");
            dtTes.Columns.Add("PID");
            dtTes.Columns.Add("NAME");
            dtTes.AcceptChanges();

            DataRow drNew = dtTes.NewRow();
            drNew["ID"] = 1;
            drNew["PID"] = 0;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 2;
            drNew["PID"] = 0;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 3;
            drNew["PID"] = 1;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 4;
            drNew["PID"] = 1;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 5;
            drNew["PID"] = 2;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 6;
            drNew["PID"] = 2;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 7;
            drNew["PID"] = 3;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);

            drNew = dtTes.NewRow();
            drNew["ID"] = 8;
            drNew["PID"] = 3;
            drNew["NAME"] = "学习";
            dtTes.Rows.Add(drNew);
            return dtTes;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public string A()
        {
            //return WebTools.WriteStaticDTree(returnDT(), "PID", 0, "NAME", "ID", "javascript:window.alert('{0}')","","DTTree");
            return WebTools.GetStaticDTree(returnDT(), "PID", 0, "NAME", "ID", "javascript:window.alert('{0}')", "", "DTTree/folder.gif", "DTTree/folder.gif", "DTTree/folder.gif", "DTTree");
        }
    }
}
