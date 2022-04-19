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

public class HeroItem : MonoBehaviour
{
    private float time = 0.5f;
    private Color defaultCor = Color.gray;
    private Color selectCor = Color.white;
    private Image img;
    private Action callBack;
    private void Start()
    {
        img = GetComponent<Image>();
        GetComponent<Button>().onClick.AddListener(Selected);
        UnSelected();
    }

    private void Selected()
    {
        if (callBack != null) 
            callBack();
        img.DOKill();
        img.DOColor(selectCor, time);
    }

    public void UnSelected()
    {
        img.DOKill();
        img.DOColor(defaultCor, time);
    }

    public void AddResetListener(Action action)
    {
        callBack = action;
    }
}