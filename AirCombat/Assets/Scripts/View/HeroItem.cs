/****************************************************
    文件：HeroItem.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;
using YFramework;

public class HeroItem : YMonoBehaviour
{
    private float time = 0.5f;
    private Color defaultCor = Color.gray;
    private Color selectCor = Color.white;
    private Image img;
    private void Start()
    {
        img = GetComponent<Image>();
        GetComponent<Button>().onClick.AddListener(()=>
        {
            MsgSend(MsgName.Select,this);
            Selected();
        });
        UnSelected(); 
    }

    public void Selected()
    {
        img.DOKill();
        img.DOColor(selectCor, time);
    }

    public void UnSelected()
    {
        img.DOKill();
        img.DOColor(defaultCor, time);
    }
    protected override void OnBeforeDestroy()
    {
        
    }
}