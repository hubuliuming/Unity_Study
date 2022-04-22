/****************************************************
    文件：LaunchGamge.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
using YFramework;

public class LaunchGame : MonoBehaviour 
{
    private void Start()
    {
        new InitCustomAttribute().Init();
        DataManager.Instance.Set(DataKeys.Level,0);
        //LoaderManager.Instance.LoadGameObject(Paths.StartView, transform);
        UIManager.Instance.Show(Paths.StartView);
    }
}