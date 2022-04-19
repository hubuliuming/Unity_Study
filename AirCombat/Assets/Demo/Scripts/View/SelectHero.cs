/****************************************************
    文件：Items.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System.Collections.Generic;
using UnityEngine;

public class SelectHero : MonoBehaviour
{ 
    private List<HeroItem> _items;

    private void Start()
    {
        _items = new List<HeroItem>(transform.childCount);
        HeroItem item = null;
        foreach (Transform trans in transform)
        {
            item = trans.gameObject.AddComponent<HeroItem>();
            item.AddResetListener(ResetState);
            _items.Add(item);
        }
    }

    private void ResetState()
    {
        foreach (HeroItem item in _items)
        {
            item.UnSelected();
        }
    }
}