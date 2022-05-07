/****************************************************
    文件：PlayerMove.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using UnityEngine;
using UnityEngine.Events;

public class PlayerMovement : MonoBehaviour
{
    private Rigidbody2D rig;
    [HideInInspector]public float horizontalMoveSpeed = 5;
    [HideInInspector]public int jumpSpeed = 12;
    [HideInInspector]public int jumpUpGravity = 3;
    [HideInInspector]public int fallGravity = 5;
    private int collisionObjCount;

    public UnityEvent OnJump;
    public UnityEvent OnLand;

    private void Start()
    {
        rig = GetComponent<Rigidbody2D>();
    }

    private void Update()
    {
        var horizontal = Input.GetAxis("Horizontal");
        rig.velocity = new Vector2(horizontal * horizontalMoveSpeed, rig.velocity.y);
        if (Input.GetKeyDown(KeyCode.Space) && collisionObjCount >= 0)
        {
            OnJump?.Invoke();
            rig.velocity = new Vector2(rig.velocity.x , jumpSpeed);
        }

        if (rig.velocity.y > 0)
        {
            rig.gravityScale = jumpUpGravity;
        }
        else
        {
            rig.gravityScale = fallGravity;
        }
    }

    private void OnCollisionEnter2D(Collision2D col)
    {
        OnLand?.Invoke();
        collisionObjCount++;
    }

    private void OnCollisionExit2D(Collision2D col)
    {
        collisionObjCount--;
    }
}