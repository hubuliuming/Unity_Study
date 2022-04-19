/****************************************************
    文件：UIUtility.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIUtility : MonoBehaviour
{
    private Dictionary<string, UIUtilityData> _datas;
    public void Init()
    {
        _datas = new Dictionary<string, UIUtilityData>();
        var rectTrans = transform.GetComponent<RectTransform>();
        foreach (RectTransform rectTran in rectTrans)
        {
            _datas.Add(rectTran.name,new UIUtilityData(rectTran));
        }
    }

    public UIUtilityData Get(string name)
    {
        if (!_datas.TryGetValue(name,out var data))
        {
            Transform temp = transform.Find(name);
            if (temp == null)
            {
                Debug.LogError("无法按照路径找到物体，路径名字为："+name);
            }
            else
            {
                _datas.Add(name, new UIUtilityData(temp.GetComponent<RectTransform>()));
            }

            return _datas[name];
        }

        return data;
    }
}

public class UIUtilityData
{
    public GameObject Go { get; private set; }
    public RectTransform RectTrans { get; private set; }
    public Image Img { get; private set; }
    public Button Btn { get; private set; }
    public Text Txt { get; private set; }

    public UIUtilityData(RectTransform rectTrans)
    {
        this.RectTrans = rectTrans;
        this.Go = rectTrans.gameObject;
        this.Img = rectTrans.GetComponent<Image>();
        this.Btn = rectTrans.GetComponent<Button>();
        this.Txt = rectTrans.GetComponent<Text>();
    }

    public void AddListener(Action action)
    {
        if (Btn != null)
        {
            Btn.onClick.AddListener(()=>action());
        }
        else
        {
            Debug.LogError("当前物体上没有Button组件，物体名字为："+Go.name);
        }
    }

    public void SetImage(Sprite sprite)
    {
        if (Img != null)
        {
            Img.sprite = sprite;
        }
        else
        {
            Debug.LogError("当前物体上没有Image组件，物体名字为："+Go.name);
        }
    }

    public void SetText(string str)
    {
        if (Txt != null)
        {
            Txt.text = str;
        }
        else
        {
            Debug.LogError("当前物体上没有Text组件，物体名字为："+Go.name);
        }
    }
}