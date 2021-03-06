﻿/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  TagFactory
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace DTCMS.TemplateEngine
{
    /// <summary>
    /// 标签工厂
    /// </summary>
    internal class TagFactory
    {
        /// <summary>
        /// 根据标签名建立标签实例
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <param name="tagName"></param>
        /// <returns></returns>
        internal static Tag FromTagName(Template ownerTemplate, string tagName)
        {
            if (!string.IsNullOrEmpty(tagName))
            {
                switch (tagName.ToLower())
                {
                    case "for":
                        return new ForTag(ownerTemplate);
                    case "foreach":
                        return new ForEachTag(ownerTemplate);
                    case "foreachelse":
                        return new ForEachElseTag(ownerTemplate);
                    case "if":
                        return new IfTag(ownerTemplate);
                    case "elseif":
                        return new IfConditionTag(ownerTemplate);
                    case "else":
                        return new ElseTag(ownerTemplate);
                    case "template":
                        return new Template(ownerTemplate);
                    case "include":
                        return new IncludeTag(ownerTemplate);
                    case "expression":
                        return new ExpressionTag(ownerTemplate);
                    case "function":
                        return new FunctionTag(ownerTemplate);
                    case "property":
                        return new PropertyTag(ownerTemplate);
                    case "server":
                        return new ServerDataTag(ownerTemplate);
                    case "set":
                        return new SetTag(ownerTemplate);
                    case "import":
                        return new ImportTag(ownerTemplate);
                    case "output":
                        return new OutputTag(ownerTemplate);
                    case "datareader":
                        if (ownerTemplate.OwnerDocument.DocumentConfig != null
                            && ownerTemplate.OwnerDocument.DocumentConfig.TagOpenMode == TagOpenMode.Full)
                        {
                            return new DataReaderTag(ownerTemplate);
                        }
                        else
                        {
                            return null;
                        }
                    case "arclist":
                        return new ArcListTag(ownerTemplate);
                    case "channel":
                        return new ChannelTag(ownerTemplate);
                    case "pagelist":
                        return new PageListTag(ownerTemplate);
                }
            }
            return null;
        }
    }
}
