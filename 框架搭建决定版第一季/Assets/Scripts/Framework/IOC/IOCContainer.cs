/****************************************************
    文件：IOCContanier.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using System.Collections.Generic;

public class IOCContainer
{
    private Dictionary<Type, object> _InstanceDict = new Dictionary<Type, object>();

    public void Register<T>(T instance)
    {
        var key = typeof(T);
        if (_InstanceDict.ContainsKey(key))
        {
            _InstanceDict[key] = instance;
        }
        else
        {
            _InstanceDict.Add(key,instance);
        }
    }

    public T Get<T>() where T : class
    {
        if (_InstanceDict.TryGetValue(typeof(T),out object value))
        {
            return value as T;
        }

        return null;
    }
}