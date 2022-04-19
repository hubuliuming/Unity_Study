/****************************************************
    文件：Items.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System.Collections.Generic;
using UnityEngine;
using YFramework;

public class SelectHero : YMonoBehaviour
{ 
    private List<HeroItem> _items;

    private void Start()
    {
        _items = new List<HeroItem>(transform.childCount);
        HeroItem item = null;
        foreach (Transform trans in transform)
        {
            item = trans.gameObject.AddComponent<HeroItem>();
            _items.Add(item);
        }
        MsgRegister(MsgName.Select, data =>
        {
            ResetState();
            HeroItem temp = data as HeroItem;
            temp.Selected();
        });
    }

    private void ResetState()
    {
        foreach (HeroItem item in _items)
        {
            item.UnSelected();
        }
    }

    protected override void OnBeforeDestroy()
    {
        
    }
}