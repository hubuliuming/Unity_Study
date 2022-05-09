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
    public enum JumpStates
    {
        NotJump,
        MinJump,
        ControllerJump
    }
    private Rigidbody2D _rig;
    [HideInInspector]public float horizontalMoveSpeed;
    [HideInInspector]public float jumpSpeed;
    [HideInInspector]public float gravityMultiplier;
    [HideInInspector]public float fallGravityMultiplier;
    private int _collisionObjCount;
    private float _horizontal;
    private float _minJumpTime = 0.1f;
    private float _maxJumpTime = 0.3f;
    private bool _jumpPress;
    private float _curJumpTime;
    
    
    public JumpStates JumpState = JumpStates.NotJump;
    

    public UnityEvent onJump;
    public UnityEvent onLand;

    private void Start()
    {
        horizontalMoveSpeed = 5;
        jumpSpeed = 12;
        gravityMultiplier = 2f;
        fallGravityMultiplier = 1;
        _rig = GetComponent<Rigidbody2D>();
        _rig.gravityScale = 5;
    }

    private void Update()
    {
        _horizontal = Input.GetAxis("Horizontal");
        if (Input.GetKeyDown(KeyCode.Space) && _collisionObjCount > 0)
        {
            onJump?.Invoke();
            _rig.velocity = new Vector2(_rig.velocity.x , jumpSpeed);
            _jumpPress = true;
            if (JumpState == JumpStates.NotJump)
            {
                JumpState = JumpStates.MinJump;
                _curJumpTime = 0;
            }
        }

        if (Input.GetKeyUp(KeyCode.Space))
            _jumpPress = false;
        _curJumpTime += Time.deltaTime;
    }

    private void FixedUpdate()
    {
        if (JumpState == JumpStates.MinJump)
        {
            _rig.velocity = new Vector2(_rig.velocity.x , jumpSpeed);
            if (_curJumpTime  >= _minJumpTime)
            {
                JumpState = JumpStates.ControllerJump;
            }
        }
        else if(JumpState == JumpStates.ControllerJump)
        {
            _rig.velocity = new Vector2(_rig.velocity.x , jumpSpeed);
            if (_jumpPress &&_curJumpTime >= _maxJumpTime || !_jumpPress)
            {
                JumpState = JumpStates.NotJump;
            }
        }
        //跳到空中
        if (_rig.velocity.y > 0 && JumpState != JumpStates.NotJump)
        {
            var progress = _curJumpTime / _maxJumpTime;
            var jumpGravityMultiplier = gravityMultiplier;
            if (progress > 0.5f)
            {
                jumpGravityMultiplier = gravityMultiplier * (1 - progress);
            }
            _rig.velocity += Physics2D.gravity * jumpGravityMultiplier * Time.deltaTime;
        }
        //下落逻辑
        else if(_rig.velocity.y < 0)
        {
            _rig.velocity += Physics2D.gravity * fallGravityMultiplier * Time.deltaTime;
        }

        _rig.velocity = new Vector2(_horizontal * horizontalMoveSpeed, _rig.velocity.y);
    }

    private void OnCollisionEnter2D(Collision2D col)
    {
        onLand?.Invoke();
        _collisionObjCount++;
    }

    private void OnCollisionExit2D(Collision2D col)
    {
        _collisionObjCount--;
    }
}