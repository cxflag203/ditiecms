﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2009-12-12 23:59:18
// 功能描述: 
// 修改标识:
// 修改描述: 
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.IO;

namespace DTCMS.Common
{
    /// <summary>
    ///WaterImage 的摘要说明
    /// </summary>
    public class WaterImage
    {
        

        #region 生成缩略图
        /// <summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="originalImagePath">源图路径（物理路径）</param>
        /// <param name="thumbnailPath">缩略图路径（物理路径）</param>
        /// <param name="width">缩略图宽度</param>
        /// <param name="height">缩略图高度</param>
        /// <param name="mode">生成缩略图的方式</param>    
        public static void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, EWaterImageType mode)
        {
            System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

            int imgWidth = width<=0?originalImage.Width:width;
            imgWidth = width > originalImage.Width ? originalImage.Width : width;
            int imgHeight = height<0?originalImage.Height:height;
            imgHeight = height > originalImage.Height ? originalImage.Height : height;
            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;
            switch (mode)
            {
                case EWaterImageType.HW://指定高宽缩放（可能变形）                
                    break;
                case EWaterImageType.W://指定宽，高按比例                    
                    imgHeight = originalImage.Height * width / originalImage.Width;
                    break;
                case EWaterImageType.H://指定高，宽按比例
                    imgWidth = originalImage.Width * height / originalImage.Height;
                    break;
                case EWaterImageType.CUT://指定高宽裁减（不变形）                
                    if ((double)originalImage.Width / (double)originalImage.Height > (double)imgWidth / (double)imgHeight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height * imgWidth / imgHeight;
                        y = 0;
                        x = (originalImage.Width - ow) / 2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width * imgHeight / imgWidth;
                        x = 0;
                        y = (originalImage.Height - oh) / 2;
                    }
                    break;
                default:
                    break;
            }

           
            Dictionary<string, string> dicImg = SetImgType();//缩略图图片格式
            System.Drawing.Bitmap bitMap = new System.Drawing.Bitmap(imgWidth, imgHeight, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            System.Drawing.Graphics graphics = System.Drawing.Graphics.FromImage(bitMap);//新建一个画板
            graphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
            graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;//设置高质量查值法
            graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;//设置高质量，低速度呈现平滑程度
            graphics.Clear(System.Drawing.Color.Transparent); //清空画布并以透明背景色填充

            //在指定位置并且按指定大小绘制原图片的指定部分
            graphics.DrawImage(originalImage, new System.Drawing.Rectangle(0, 0, imgWidth, imgHeight),new System.Drawing.Rectangle(x, y, ow, oh),
                System.Drawing.GraphicsUnit.Pixel);

            //设置 原图片 对象的 EncoderParameters 对象
            System.Drawing.Imaging.EncoderParameters parms = new System.Drawing.Imaging.EncoderParameters(1);
            parms.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, ((long)100));
            string extension = Path.GetExtension(originalImagePath).ToLower();
            System.Drawing.Imaging.ImageCodecInfo imgCodeInfo = GetImageCodeInfo(dicImg[extension].ToString());

            string directoryPath = Path.GetDirectoryName(thumbnailPath);
            //看是否存在目录 不存在则创建目录
            if (!System.IO.File.Exists(directoryPath))
            {
                System.IO.Directory.CreateDirectory(directoryPath);
            }
            try
            {
                bitMap.Save(thumbnailPath, imgCodeInfo, parms);
            }
            catch
            {

            }
            finally
            {
                originalImage.Dispose();
                bitMap.Dispose();
                graphics.Dispose();
                parms.Dispose();
            }
        }
        #endregion

        #region 在图片上增加文字水印
        /// <summary>
        /// 在图片上增加文字水印
        /// </summary>
        /// <param name="Path">原服务器图片路径</param>
        /// <param name="Path_sy">生成的带文字水印的图片路径</param>
        /// <param name="waterCharater">水印文字</param>
        /// <param name="xPercent">水印文字与图片左上角X轴的百分比（用小数表示）0~1</param>
        /// <param name="yPercent">水印文字与图片左上角Y轴的百分比（用小数表示）0~1</param>
        /// <param name="charColor">文字颜色System.Color</param>
        public static void AddWater(string Path, string Path_sy, string waterCharater, double xPercent, double yPercent,System.Drawing.Color charColor,string fontFamilyName,int fontSize)
        {
            if (!File.Exists(Path))
            {
                throw new FileNotFoundException("指定路径的文件不存在");
            }
            else
            {
                if (string.IsNullOrEmpty(fontFamilyName))
                    fontFamilyName = "仿宋";
                System.Drawing.Image image = System.Drawing.Image.FromFile(Path);
                System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(image.Width, image.Height, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
                System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;// HighQuality;
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                g.Clear(System.Drawing.Color.Transparent);

                System.Drawing.Imaging.EncoderParameters parms = new System.Drawing.Imaging.EncoderParameters(1);
                parms.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, ((long)80));
                string extension = System.IO.Path.GetExtension(Path).ToLower();
                System.Drawing.Imaging.ImageCodecInfo imgCodeInfo = GetImageCodeInfo(SetImgType()[extension].ToString());

                g.DrawImage(image, 0, 0, image.Width, image.Height);
                System.Drawing.Font f = new System.Drawing.Font(fontFamilyName, fontSize);
                System.Drawing.Brush b = new System.Drawing.SolidBrush(charColor);
                float x = (float)Convert.ToDecimal(image.Height * xPercent);
                float y = (float)Convert.ToDecimal(image.Width * yPercent);
                g.DrawString(waterCharater, f, b, x, y);
                g.Dispose();
                //image.Save(Path_sy);
                image.Dispose();
                bitmap.Save(Path_sy, imgCodeInfo, parms);
                bitmap.Dispose();
            }
            
        }
        #endregion

        #region 在图片上生成图片水印
        /// <summary>
        /// 在图片上生成图片水印
        /// </summary>
        /// <param name="Path">原服务器图片路径</param>
        /// <param name="Path_syp">生成的带图片水印的图片路径</param>
        /// <param name="Path_sypf">水印图片路径</param>
        /// <param name="xPer">x轴位置百分比 （用小数表示）0~1</param>
        /// <param name="yPer">y轴位置百分比 （用小数表示）0~1</param>
        /// <param name="transparence">透明度（用小数表示）0~1</param>
        public static void AddWaterPic(string Path, string Path_syp, string Path_sypf, double xPer, double yPer, float transparence)
        {
            if (!File.Exists(Path))
            {
                throw new FileNotFoundException("指定原图片路径的文件不存在");
            }
            else
            {
                System.Drawing.Image image = System.Drawing.Image.FromFile(Path);
                System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(image.Width, image.Height, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
                if(!File.Exists(Path_sypf))
                    throw new FileNotFoundException("指定水印图片路径的文件不存在");

                System.Drawing.Image copyImage = System.Drawing.Image.FromFile(Path_sypf);
                System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                g.Clear(System.Drawing.Color.Transparent);

                System.Drawing.Imaging.EncoderParameters parms = new System.Drawing.Imaging.EncoderParameters(1);
                parms.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, ((long)80));
                string extension = System.IO.Path.GetExtension(Path).ToLower();
                System.Drawing.Imaging.ImageCodecInfo imgCodeInfo = GetImageCodeInfo(SetImgType()[extension].ToString());

                g.DrawImage(image, 0, 0, image.Width, image.Height);
                float[][] ptsArray ={ 
                                            new float[] {1, 0, 0, 0, 0},
                                            new float[] {0, 1, 0, 0, 0},
                                            new float[] {0, 0, 1, 0, 0},
                                            new float[] {0, 0, 0, transparence, 0},
                                            new float[] {0, 0, 0, 0, 1}
                                  };
                System.Drawing.Imaging.ColorMatrix colorMatrix = new System.Drawing.Imaging.ColorMatrix(ptsArray);
                System.Drawing.Imaging.ImageAttributes imageAttribute = new System.Drawing.Imaging.ImageAttributes();
                imageAttribute.SetColorMatrix(colorMatrix);

                int x = (int)Convert.ToInt32(image.Width * xPer);
                int y = (int)Convert.ToInt32(image.Height * yPer);
                g.DrawImage(copyImage, new System.Drawing.Rectangle(x, y, copyImage.Width, copyImage.Height), 0, 0, copyImage.Width, copyImage.Height, System.Drawing.GraphicsUnit.Pixel, imageAttribute);
                g.Dispose();

                image.Dispose();
                bitmap.Save(Path_syp,imgCodeInfo,parms);
                copyImage.Dispose();
                bitmap.Dispose();
            }
        }
        #endregion

       
        #region 获取图像编码解码器的所有相关信息
        /// <summary>
        /// 获取图像编码解码器的所有相关信息
        /// </summary>
        /// <param name="mimeType">包含编码解码器的多用途网际邮件扩充协议 (MIME) 类型的字符串</param>
        /// <returns>返回图像编码解码器的所有相关信息</returns>
        private static System.Drawing.Imaging.ImageCodecInfo GetImageCodeInfo(string mimeType)
        {
            System.Drawing.Imaging.ImageCodecInfo[] imgCodeInfo = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
            foreach (System.Drawing.Imaging.ImageCodecInfo codeInfo in imgCodeInfo)
            {
                if (codeInfo.MimeType == mimeType)
                {
                    return codeInfo;
                }
            }
            return null;
        }
        /// <summary>
        /// 设置图片类型
        /// </summary>
        /// <returns></returns>
        private static Dictionary<string, string> SetImgType()
        {
            Dictionary<string, string> dicImg = new Dictionary<string, string>();
            dicImg.Add(".gif", "image/gif");
            dicImg.Add(".bmp", "image/bmp");
            dicImg.Add(".jpg", "image/jpeg");
            dicImg.Add(".icon", "image/icon");
            dicImg.Add(".jpeg", "image/jpeg");
            dicImg.Add(".png", "image/png");
            dicImg.Add(".tif", "image/tiff");
            dicImg.Add(".tiff", "image/tiff");

            return dicImg;
        }
        #endregion
    }
    /// <summary>
    /// 缩略方式
    /// </summary>
    public enum EWaterImageType
    {
        /// <summary>
        /// 指定高宽缩放（可能变形）                
        /// </summary>
        HW,

        /// <summary>
        /// 指定宽，高按比例
        /// </summary>
        W,

        /// <summary>
        /// 指定高，宽按比例
        /// </summary>
        H,

        /// <summary>
        /// 指定高宽裁减（不变形）
        /// </summary>
        CUT,

        /// <summary>
        /// 宽高为0
        /// </summary>
        NO
    }
}