/****************************************************
    文件：SubtractountCommand.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using CounterApp;
using UnityEngine;

public struct SubtractountCommand : ICommand 
{
    public void Execute()
    {
        CounterApp.CounterApp.Get<CounterModel>().Count.Value--;
    }
}