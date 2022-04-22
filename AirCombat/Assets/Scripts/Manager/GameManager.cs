/****************************************************
    文件：GameManager.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using YFramework;

public class GameManager : MonoSingleton<GameManager>
{
    public void Init()
    {
        InitData();
    }

    public void InitData()
    {
        DataManager.Instance.Set(DataKeys.Level,0);
    }
}