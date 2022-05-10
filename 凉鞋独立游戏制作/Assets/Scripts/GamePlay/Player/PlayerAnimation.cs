/****************************************************
    文件：PlayerAnimation.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using UnityEngine;

public class PlayerAnimation : MonoBehaviour
{
    private PlayerMovement _playerMovement;
    private Rigidbody2D rig;
    private void Start()
    {
        rig = GetComponent<Rigidbody2D>();
        _playerMovement = GetComponent<PlayerMovement>();
    }

    private void Update()
    {
        var scaleOffset = 0.3f * MathF.Abs(rig.velocity.x/_playerMovement.horizontalMoveSpeed);
        transform.localScale = new Vector3(1f + scaleOffset, 0.7f + 0.3f, 1f);
    }
}