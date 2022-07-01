/****************************************************
    文件：Event.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;

public class Event<T> where T : Event<T>
{
    private static Action _onEvent;

    public static void Register(Action onEvent)
    {
        _onEvent += onEvent;
    }

    public static void UnRegister(Action onEvent)
    {
        _onEvent -= onEvent;
    }

    public static void Trigger()
    {
        _onEvent?.Invoke();
    }
}