﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2010-03-01 17:30:10
// 功能描述: DataGrid Control
// 修改标识: 
// 修改描述: 
//------------------------------------------------------------------------------
using System;
using System.Text;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;

[assembly: TagPrefix("DTCMS.Controls", "DT")]
namespace DTCMS.Controls
{
    /// <summary>
    /// DataGrid 服务器控件
    /// </summary>
    [ToolboxData("<{0}:DataGrid CssClass='table_data' runat='server'></{0}:DataGrid>")]
    [DefaultProperty("Text")]
    public class DataGrid : WebControl, INamingContainer
    {
        #region DataGrid属性

        private string _id;
        private string _bindAjaxMethod;
        private bool _isPage = true;
        private int _pageSize = 15;
        private string _cssClass;
        private string _rowHandler;
        private ColumnCollection _columns;

        /// <summary>
        /// 控件ID
        /// </summary>
        [DefaultValue("")]
        [Description("控件ID")]
        public override string ID
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// 绑定数据客户端Ajax方法
        /// </summary>
        [DefaultValue("")]
        [Description("客户端绑定数据Ajax方法")]
        public string BindAjaxMethod
        {
            get { return _bindAjaxMethod; }
            set { _bindAjaxMethod = value; }
        }

        /// <summary>
        /// 数据列是否分页
        /// </summary>
        [DefaultValue(true)]
        [Category("Behavior")]
        [Description("数据列是否分页")]
        public bool IsPage
        {
            get { return _isPage; }
            set { _isPage = value; }
        }

        /// <summary>
        /// 数据列分页大小
        /// </summary>
        [DefaultValue(15)]
        [Category("Behavior")]
        [Description("数据列分页大小")]
        public int PageSize
        {
            get { return _pageSize; }
            set { _pageSize = value; }
        }

        /// <summary>
        /// 应用于该控件的CSS类名
        /// </summary>
        [DefaultValue("")]
        [Category("Behavior")]
        [Description("应用于该控件的CSS类名")]
        public override string CssClass
        {
            get { return _cssClass; }
            set { _cssClass = value; }
        }

        /// <summary>
        /// 数据列表行事件
        /// </summary>
        [DefaultValue("")]
        [Category("Behavior")]
        [Description("数据列表行事件")]
        public string RowHandler
        {
            get { return _rowHandler; }
            set { _rowHandler = value; }
        }

        /// <summary>
        /// 创建 ColumnItem 控件容器
        /// </summary>
        [PersistenceMode(PersistenceMode.InnerProperty)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [Description("要在控件中显示的一组列")]
        public ColumnCollection Colunms
        {
            get
            {
                if (_columns == null)
                {
                    _columns = new ColumnCollection();
                }
                return _columns;
            }
        }
        #endregion

        /// <summary>
        /// 重写Render方法
        /// </summary>
        protected override void Render(HtmlTextWriter output)
        {
            //构造Table标签
            output.AddAttribute(HtmlTextWriterAttribute.Id, this.ID);
            if (this.CssClass != null)
            {
                output.AddAttribute(HtmlTextWriterAttribute.Class, this.CssClass);
            }
            output.RenderBeginTag(HtmlTextWriterTag.Table);

            //构造Thead标签
            output.RenderBeginTag(HtmlTextWriterTag.Thead);
            output.AddAttribute(HtmlTextWriterAttribute.Class, "thead");
            output.RenderBeginTag(HtmlTextWriterTag.Tr);

            StringBuilder sortJs = new StringBuilder();
            StringBuilder fieldsColumn = new StringBuilder();
            string sysColumn = string.Empty;

            int colSpan = Colunms.Count;
            for (int i = 0; i < Colunms.Count; i++)
            {
                if (Colunms[i].GetType() == typeof(CheckBox))
                {
                    CheckBox checkBox = (CheckBox)this.Colunms[i];
                    //是否显示CheckBox
                    if (checkBox.Visible)
                    {
                        if (checkBox.Width != null)
                        {
                            output.AddAttribute(HtmlTextWriterAttribute.Width, checkBox.Width);
                        }
                        output.RenderBeginTag(HtmlTextWriterTag.Th);

                        output.AddAttribute(HtmlTextWriterAttribute.Type, "checkbox");
                        output.AddAttribute(HtmlTextWriterAttribute.Onclick, "invertCheckBox(this)");
                        output.RenderBeginTag(HtmlTextWriterTag.Input);
                        output.RenderEndTag();
                        output.RenderEndTag();

                        if (checkBox.DataField == null)
                        {
                            sysColumn += "checkbox:{visible:true},";
                        }
                        else
                        {
                            sysColumn += string.Format("checkbox:{{visible:true,id:'{0}'}},", checkBox.DataField.ToLower());
                        }
                    }
                    else
                    {
                        colSpan--;
                    }
                }
                else if (Colunms[i].GetType() == typeof(RowsIndex))
                {
                    RowsIndex rowsIndex = (RowsIndex)this.Colunms[i];
                    //是否显示数据行索引
                    if (rowsIndex.Visible)
                    {
                        if (rowsIndex.Width != null)
                        {
                            output.AddAttribute(HtmlTextWriterAttribute.Width, rowsIndex.Width);
                        }
                        output.RenderBeginTag(HtmlTextWriterTag.Th);
                        output.Write(rowsIndex.HeaderText);
                        output.RenderEndTag();

                        if (rowsIndex.DataField == null)
                        {
                            sysColumn += "rowsindex:{visible:true},";
                        }
                        else
                        {
                            sysColumn += string.Format("rowsindex:{{visible:true,id:'{0}'}},", rowsIndex.DataField.ToLower());
                        }
                    }
                    else
                    {
                        colSpan--;
                    }
                }
                else
                {
                    //构造表头集合
                    ColumnItem columnItem = (ColumnItem)this.Colunms[i];
                    if (columnItem.Width != null)
                    {
                        output.AddAttribute(HtmlTextWriterAttribute.Width, columnItem.Width);
                    }
                    if (columnItem.CssClass != null)
                    {
                        output.AddAttribute(HtmlTextWriterAttribute.Class, columnItem.CssClass);
                    }
                    output.RenderBeginTag(HtmlTextWriterTag.Th);

                    //如果排序字段不为空，则添加客户端排序方法
                    if (columnItem.SortField != null)
                    {
                        output.AddAttribute(HtmlTextWriterAttribute.Id, columnItem.DataField);
                        output.AddAttribute(HtmlTextWriterAttribute.Href, "javascript:;");
                        output.AddAttribute(HtmlTextWriterAttribute.Title, "点击排序");
                        output.AddAttribute(HtmlTextWriterAttribute.Onclick, "onSortClick(this);");
                        output.AddAttribute(HtmlTextWriterAttribute.Class, "nosort");
                        output.AddAttribute("hidefocus", "true");
                        output.RenderBeginTag(HtmlTextWriterTag.A);
                        output.Write(columnItem.HeaderText);

                        //生成排序图标
                        output.AddAttribute(HtmlTextWriterAttribute.Id, string.Format("{0}_SortType", columnItem.DataField));
                        output.RenderBeginTag(HtmlTextWriterTag.Span);
                        output.RenderEndTag();

                        output.RenderEndTag();

                        //生成排序JS
                        sortJs.AppendFormat("if(document.getElementById('{0}').className!='nosort'){{sortValue+=',{1} '+document.getElementById('{0}').className;count++;}}", columnItem.DataField, columnItem.SortField);
                    }
                    else
                    {
                        output.Write(columnItem.HeaderText);
                    }
                    output.RenderEndTag();

                    //生成FieldColumn
                    fieldsColumn.AppendFormat("{{name:'{0}'", columnItem.DataField.ToLower());
                    if (columnItem.DataFormat != null)
                    {
                        fieldsColumn.AppendFormat(",dataFormat:{0}", columnItem.DataFormat);
                    }
                    fieldsColumn.Append("},");
                }
            }
            output.RenderEndTag();
            output.RenderEndTag();

            //构造Tbody标签
            output.AddAttribute(HtmlTextWriterAttribute.Id, "dataList");
            output.RenderBeginTag(HtmlTextWriterTag.Tbody);
            output.RenderBeginTag(HtmlTextWriterTag.Tr);
            output.AddAttribute(HtmlTextWriterAttribute.Colspan, colSpan.ToString());
            output.AddAttribute(HtmlTextWriterAttribute.Style, "height:270px");
            output.RenderBeginTag(HtmlTextWriterTag.Td);
            output.RenderEndTag();
            output.RenderEndTag();
            output.RenderEndTag();

            #region 构造列表分页ToolBar
            if (this.IsPage)
            {
                //构造Tfoot标签
                output.AddAttribute(HtmlTextWriterAttribute.Class, "tfoot");
                output.RenderBeginTag(HtmlTextWriterTag.Tfoot);
                output.RenderBeginTag(HtmlTextWriterTag.Tr);
                output.AddAttribute(HtmlTextWriterAttribute.Colspan, colSpan.ToString());
                output.RenderBeginTag(HtmlTextWriterTag.Td);

                //构造PageBar开始
                output.AddAttribute(HtmlTextWriterAttribute.Class, "pagebar");
                output.RenderBeginTag(HtmlTextWriterTag.Div);

                output.AddAttribute(HtmlTextWriterAttribute.Class, "pGroup");
                output.RenderBeginTag(HtmlTextWriterTag.Div);
                output.WriteLine("<a id=\"pFirst\" class=\"pFirst_dis\" hidefocus=\"true\" href=\"javascript:;\" onclick=\"goPage(this)\" title=\"首页\"></a>");
                output.WriteLine("<a id=\"pPrev\" class=\"pPrev_dis\" hidefocus=\"true\" href=\"javascript:;\" onclick=\"goPage(this)\" onmouseover=\"statusMsg('帮助小贴士，用键盘左右键可以快速翻页');return document.returnValue;\" onmouseout=\"window.status='';\" title=\"上一页\"></a>");
                output.RenderEndTag();

                output.WriteLine("<p class=\"separator\"></p>");

                output.AddAttribute(HtmlTextWriterAttribute.Class, "pGroup");
                output.RenderBeginTag(HtmlTextWriterTag.Div);
                output.WriteLine("第 <input value=\"1\" id=\"curPage\" type=\"text\" onkeydown=\"jumpPage(this.value,event);\" title=\"输入页码后按回车跳转\" /> 页 / 共<span id=\"totalPage\">0</span>页");
                output.RenderEndTag();

                output.WriteLine("<p class=\"separator\"></p>");

                output.AddAttribute(HtmlTextWriterAttribute.Class, "pGroup");
                output.RenderBeginTag(HtmlTextWriterTag.Div);
                output.WriteLine("<a id=\"pNext\" class=\"pNext\" hidefocus=\"true\" href=\"javascript:;\" onclick=\"goPage(this)\" onmouseover=\"statusMsg('帮助小贴士，用键盘左右键可以快速翻页');return document.returnValue;\" onmouseout=\"window.status='';\" title=\"下一页\"></a>");
                output.WriteLine("<a id=\"pLast\" class=\"pLast\" hidefocus=\"true\" href=\"javascript:;\" onclick=\"goPage(this)\" title=\"末页\"></a>");
                output.RenderEndTag();

                output.WriteLine("<p class=\"separator\"></p>");

                output.AddAttribute(HtmlTextWriterAttribute.Class, "pGroup");
                output.RenderBeginTag(HtmlTextWriterTag.Div);
                output.WriteLine("每页显示条数：<select onchange=\"setPageSize(this)\" title=\"每页显示条数\"><option value=\"5\">5</option><option value=\"10\">10</option><option value=\"15\" selected=\"selected\">15</option><option value=\"20\">20</option><option value=\"25\">25</option><option value=\"40\">40</option></select>\r\n");
                output.RenderEndTag();
                output.RenderEndTag();

                output.AddAttribute(HtmlTextWriterAttribute.Id, "pPageStat");
                output.RenderBeginTag(HtmlTextWriterTag.Span);
                //output.Write("正在加载数据，请稍候...");
                output.RenderEndTag();
                //构造PageBar结束

                output.RenderEndTag();
                output.RenderEndTag();
                output.RenderEndTag();
            }
            #endregion

            output.RenderEndTag();

            output.WriteLine();
            output.WriteLine("<script type=\"text/javascript\">");
            output.Write("function onSortClick(obj){if(obj.className=='nosort'){obj.className='desc';}else if(obj.className=='desc'){obj.className='asc';}else{obj.className='nosort';}\r\n");
            output.Write("var count=0;sortValue='';");
            output.Write(sortJs.ToString());
            output.WriteLine("if(count>0){sortValue=sortValue.substring(1,sortValue.length);}loadDataLoading();}");
            output.Write("function showDataList(data){if(data!=''){var json=eval('data='+data);totalRecord=json.totalRecord;totalPage=Math.ceil(totalRecord/pageSize);var option={jsondata:json.dataTable,");
            output.Write(sysColumn);
            output.Write(string.Format("fields:[{0}],", fieldsColumn.ToString().TrimEnd(',')));
            if (this.RowHandler != null)
            {
                output.Write(string.Format("rowhandler:'{0}',", this.RowHandler));
            }
            output.WriteLine("curpage:curPage,pagesize:pageSize,totalrecord:totalRecord};$('#dataList').gridview(option);}}");
            output.WriteLine(BuildJavaScript());
            output.WriteLine("</script>");
        }

        /// <summary>
        /// 创建Javascript脚本
        /// </summary>
        /// <returns></returns>
        private string BuildJavaScript()
        {
            StringBuilder js = new StringBuilder();
            if (this.IsPage)
            {
                js.Append(string.Format("var curPage=1;var pageSize={0};var totalPage;", PageSize));
            }
            js.Append("var totalRecord;var sortValue;\r\n");
            js.Append("$(function(){loadDataLoading();});\r\n");
            js.Append("function loadDataLoading(){showLoading('正在加载数据，请稍候...','#dataList');loadData();hideMessage();}\r\n");
            js.Append("function loadData(){var callback=function(res){if(res.error){alert(\"请求错误，请刷新页面重试！\\n\"+res.error.Message);return;}showDataList(res.value);};");
            js.Append(this.BindAjaxMethod);
            if (this.IsPage)
            {
                js.Append("(curPage,pageSize,sortValue,callback);}\r\n");
                js.Append("function goPage(obj){switch(obj.id){");
                js.Append("case 'pFirst':if(curPage==1){return;}else{curPage=1;break;}case 'pNext':curPage++;break;case 'pPrev':curPage--;break;case 'pLast':if(curPage==totalPage){return;}else{curPage=totalPage;break;}}");
                js.Append("if(curPage>totalPage){curPage=totalPage;return}if(curPage<1){curPage=1;return}loadDataLoading()}");
                js.Append("function setPageSize(opt){pageSize=opt[opt.selectedIndex].text;totalPage=Math.ceil(totalRecord/pageSize);if(curPage>totalPage)curPage=totalPage;loadDataLoading();}\r\n");
                js.Append("function jumpPage(val,e){e=e||event;val=parseInt(val);if(e.keyCode==13&&val>0&&val<=totalPage&&val!=curPage){curPage=val;loadDataLoading();}}\r\n");
                js.Append("document.onkeydown=function(e){e=e||event;if(e.keyCode==37){curPage--;}else if(e.keyCode==39){curPage++;}else{return;}if(curPage>totalPage){curPage=totalPage;return;}if(curPage<1){curPage=1;return;}loadDataLoading();}");
            }
            else
            {
                js.Append("(sortValue,callback);}");
            }
            return js.ToString();
        }
    }
}
