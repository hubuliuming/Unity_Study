/****************************************************
    文件：Test.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using UnityEngine;

public class Test : MonoBehaviour
{
    [HideInInspector] public int X = 1;
    
    
    private Lazy<int> _lazy = new Lazy<int>();
    
    private void Start()
    {
        
    }
}