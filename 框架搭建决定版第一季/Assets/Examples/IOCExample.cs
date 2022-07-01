/****************************************************
    文件：IOCExample.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

public class IOCExample : MonoBehaviour 
{
    private void Start()
    {
        var container = new IOCContainer();
        container.Register(new BluetoothManager());
        var bluetoothManager = container.Get<BluetoothManager>();
        bluetoothManager.Connect();
    }
}

public class BluetoothManager
{
    public void Connect()
    {
        Debug.Log("蓝牙链接");
    }
}