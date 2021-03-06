﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2009-10-29 19:53:42
// 功能描述: 
// 修改标识:
// 修改描述: 
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Text;
using DTCMS.Common.Xml;
using DTCMS.Common;
using System.Xml;

namespace DTCMS.Config
{
    public class BaseConfig
    {
        private XmlDocumentExtender xmlDoc = null;

        protected XmlDocumentExtender GetXmlInstance(string path)
        {
            if (xmlDoc == null)
            {
                xmlDoc = new XmlDocumentExtender();
            }
            xmlDoc.Load(path);
            return xmlDoc;
        }

        protected XmlNodeList SelectNodes(string xmlPath, string nodePath)
        {
            if (xmlDoc == null)
            {
                GetXmlInstance(xmlPath);
            }

            return xmlDoc.DocumentElement.SelectNodes(nodePath);
        }

        protected XmlNode SelectSingleNodes(string xmlPath, string nodePath)
        {
            if (xmlDoc == null)
            {
                GetXmlInstance(xmlPath);
            }
            return xmlDoc.DocumentElement.SelectSingleNode(nodePath);
        }

    }
}
