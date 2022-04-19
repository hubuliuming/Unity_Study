/****************************************************
    文件：UIManager.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System.Collections.Generic;
using UnityEngine;

public class UIManager : NormalSingleton<UIManager>
{
    private Canvas _canvas;
    public Canvas Canvas
    {
        get
        {
            if (_canvas == null)
                _canvas = Object.FindObjectOfType<Canvas>();
            if(_canvas == null)
                Debug.LogError("场景中不存在Canvas");
            return _canvas;
        }
    }
    private Stack<string> _uiStack = new Stack<string>();
    private Dictionary<string, IView> _views = new Dictionary<string, IView>();
    
    public IView Show(string path)
    {
        if (_uiStack.Count > 0)
        {
            var name = _uiStack.Peek();
            _views[name].Hide();
        }

        IView view = InitView(path);
        view.Show();
        _uiStack.Push(path);
        _views[path] = view;
        return view;
    }

    private IView InitView(string path)
    {
        if (!_views.TryGetValue(path,out var view))
        {
            var go = LoaderManager.Instance.LoadGameObject(path, Canvas.transform);
            var type = BindUtility.GetType(path);
            var component = go.AddComponent(type);
            IView v = null;
            if (component is IView)
            {
                v = component as IView;
                v.Init();
            }
            else
            {
                Debug.LogError("当前添加脚本未继承ViewBase");
            }
            
            return v;
        }

        return view;
    }

    public void Back()
    {
        if (_uiStack.Count <= 1) return;
        string name = _uiStack.Pop();
        _views[name].Hide();
        name = _uiStack.Peek();
        _views[name].Show();
    }
}