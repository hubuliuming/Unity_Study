/****************************************************
    文件：Test.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using UnityEngine;
using UnityEngine.UI;

public class Test : MonoBehaviour
{
    private void Start()
    {
        int index = 0;
        for (int i = 0; i < transform.childCount; i++)
        {
            if (transform.GetChild(i).gameObject.activeSelf == false)
            {
                index++;
                Debug.Log(transform.GetChild(i).gameObject);
            }
        }
        Debug.Log("隐藏子物体的个数为"+index);

        InputField inputField = GetComponent<InputField>();
    }
}