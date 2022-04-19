/****************************************************
    文件：ILoader.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：加载器接口
*****************************************************/


using UnityEngine;

public interface ILoader
{
    GameObject LoadGameObject(string path, Transform parent = null);
}