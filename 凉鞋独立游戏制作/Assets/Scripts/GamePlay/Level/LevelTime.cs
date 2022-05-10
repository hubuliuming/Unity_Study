/****************************************************
    文件：LevelTime.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using UnityEngine;
using UnityEngine.UI;

public class LevelTime : MonoBehaviour
{
    private Text _levelTimeText;
    private float _curSeconds;
    private void Start()
    {
        _levelTimeText = GetComponent<Text>();
    }

    private void Update()
    {
        _curSeconds += Time.deltaTime;
        if (Time.frameCount%20 == 0)
            _levelTimeText.text = ((int) _curSeconds).ToString();
    }
}