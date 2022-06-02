/****************************************************
    文件：PlayerController.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private Rigidbody _rig;
    private float _inputH;
    private float _inputV;
    private float _speed;
    private void Start()
    {
        _rig = GetComponent<Rigidbody>();
        _speed = 3;
        
    }

    private void Update()
    {
        _inputH = Input.GetAxis("Horizontal");
        _inputV = Input.GetAxis("Vertical");
    }

    private void FixedUpdate()
    {
        if (_inputV !=0)
        {
            _rig.MovePosition(Time.fixedDeltaTime *_speed*_inputV * transform.forward + transform.position);                                          
        }

        if (_inputH != 0)
        {
            _rig.MovePosition(Time.fixedDeltaTime *_speed*_inputH * transform.right + transform.position);
        }
    }
}