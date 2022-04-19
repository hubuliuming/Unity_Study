/****************************************************
    文件：StartView.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
[BindPrefab(Paths.StartView)]
public class StartView : ViewBase 
{
    public override void Init()
    {
        base.Init();
        UiUtility.Get("Start").AddListener(() =>
        {
            UIManager.Instance.Show(Paths.SelectedHeroView);
        });
    }
}