/****************************************************
    文件：StrengthenView.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using YFramework;
using YFramework.UI;
[BindPrefab(Paths.StrengthenView)]
public class StrengthenView : UIBase 
{
    private void Start()
    {
        UiUtility.Get("Switchplayer").Go.GetOrAddComponent<Switchplayer>().Show();
    }
}