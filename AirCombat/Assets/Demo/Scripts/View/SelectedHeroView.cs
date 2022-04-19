/****************************************************
    文件：SelectedHeroView.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
[BindPrefab(Paths.SelectedHeroView)]
public class SelectedHeroView : ViewBase 
{
    public override void Init()
    {
        base.Init();
        UiUtility.Get("Heros").Go.AddComponent<SelectHero>();
        UiUtility.Get("OK/Start").AddListener(()=>
        {
            //todo 切换到选择关卡
        });
        UiUtility.Get("Exit").AddListener(() =>
        {
            Application.Quit();
        });
        UiUtility.Get("Strengthen").AddListener(()=>
        {
            //todo 切换到强化界面
        });
    }
}