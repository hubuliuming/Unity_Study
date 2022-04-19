/****************************************************
    文件：ManagerLoader.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

public class LoaderManager : NormalSingleton<LoaderManager>
{
    private ILoader _Loader;

    public LoaderManager()
    {
        _Loader = new ResLoader();
    }

    public GameObject LoadGameObject(string path, Transform parent = null)
    {
        return _Loader.LoadGameObject(path, parent);
    }

}