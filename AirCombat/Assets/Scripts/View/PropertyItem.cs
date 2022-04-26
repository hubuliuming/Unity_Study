/****************************************************
    文件：PropertyItem.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using YFramework;
using YFramework.UI;

public class PropertyItem : UIBase 
{
    public enum Property
    {
        Attack,
        FireRate,
        Life,
        COUNT
    }
    public override void Init()
    {
        base.Init();
        LoaderManager.Instance.LoadGameObject(Paths.PropertyItem);
        // foreach (string s in Enum.GetNames(typeof(Property)))
        // {
        //     Debug.Log(s);
        // }
        for (Property i = 0; i < Property.COUNT; i++)
        {
            Debug.Log(i);
        }
    }
}