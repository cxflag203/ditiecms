﻿using System;
using System.ComponentModel;
using System.Web.UI;

namespace DTCMS.Controls
{
    /// <summary>
    /// ColumnItem 成员属性
    /// </summary>
    [ToolboxItem(false)]
    public class ColumnItem : ItemBase
    {
        private string _headerText;
        private string _dataField;
        private string _align;
        private string _width;
        private string _cssClass;
        private bool _isSort;

        /// <summary>
        /// 列名
        /// </summary>
        [NotifyParentProperty(true)]
        [Description("列名")]
        public string HeaderText
        {
            get { return _headerText; }
            set { _headerText = value; }
        }

        /// <summary>
        /// 绑定字段
        /// </summary>
        [NotifyParentProperty(true)]
        [Description("绑定字段")]
        public string DataField
        {
            get { return _dataField; }
            set { _dataField = value; }
        }

        /// <summary>
        /// 对齐方式
        /// </summary>
        [NotifyParentProperty(true)]
        [Description("对齐方式")]
        public string Align
        {
            get { return _align; }
            set { _align = value; }
        }

        /// <summary>
        /// 列宽度
        /// </summary>
        [NotifyParentProperty(true)]
        [Description("列宽度")]
        public string Width
        {
            get { return _width; }
            set { _width = value; }
        }

        /// <summary>
        /// 表头的CSS类名
        /// </summary>
        [NotifyParentProperty(true)]
        [Description("表头的CSS类名")]
        public string CssClass
        {
            get { return _cssClass; }
            set { _cssClass = value; }
        }

        /// <summary>
        /// 单击表头是否排序
        /// </summary>
        [NotifyParentProperty(true)]
        [Description("单击表头是否排序")]
        public bool IsSort
        {
            get { return _isSort; }
            set { _isSort = value; }
        }
    }
}
