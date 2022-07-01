/****************************************************
    文件：CounterApp.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

namespace CounterApp
{
    public class CounterApp : Architecture<CounterApp>
    {
        protected override void Init()
        {
            Register<CounterModel>(new CounterModel());
        }
        // private static IOCContainer _container;
        //
        // static void MakeSureContainer()
        // {
        //     if (_container == null)
        //     {
        //         _container = new IOCContainer();
        //         Init();
        //     }
        // }
        //
        // static void Init()
        // {
        //     _container.Register(new CounterModel());
        // }
        //
        // public static T Get<T>() where T : class
        // {
        //     MakeSureContainer();
        //     return _container.Get<T>();
        // }
        
    }
}