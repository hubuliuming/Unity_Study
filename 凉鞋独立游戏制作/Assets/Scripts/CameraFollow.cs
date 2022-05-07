/****************************************************
    文件：CameraFollow.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform Player;

    private void Update()
    {
        var camPos = transform.localPosition;
        camPos.x = Player.position.x;
        camPos.y = Player.position.y + 2;
        transform.localPosition = camPos;
    }
}