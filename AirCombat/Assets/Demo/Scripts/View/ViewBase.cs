/****************************************************
    文件：ViewBase.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

public abstract class ViewBase : MonoBehaviour,IView
{
    private UIUtility _uiUtility;

    protected UIUtility UiUtility
    {
        get
        {
            if (_uiUtility == null)
            {
                _uiUtility = gameObject.AddComponent<UIUtility>();
                _uiUtility.Init();
            }

            return _uiUtility;
        }
    }
    public virtual void Init()
    {
        
    }

    public virtual void Show()
    {
        gameObject.SetActive(true);
    }

    public virtual void Hide()
    {
        gameObject.SetActive(false);
    }
}