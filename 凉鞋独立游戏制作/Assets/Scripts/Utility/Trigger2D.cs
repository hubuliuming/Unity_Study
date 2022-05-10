/****************************************************
    文件：Trigger2D.cs
    作者：Y
    邮箱: 916111418@qq.com
    日期：#CreateTime#
    功能：Nothing
*****************************************************/

using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Trigger2D : MonoBehaviour
{
    public bool triggered;
    private HashSet<Collider2D> _collider2Ds = new HashSet<Collider2D>();
    public UnityEvent onTriggerEnter = new UnityEvent();
    public UnityEvent onTriggerExit = new UnityEvent();
    public LayerMask layer;
    private void OnTriggerEnter2D(Collider2D col)
    {
        // 1000
        if (LayerMaskUtility.Contains(layer,col.gameObject.layer))
        {
            _collider2Ds.Add(col);
            if (!triggered &&_collider2Ds.Count == 1)
            {
                triggered = true;
                onTriggerEnter?.Invoke();
            }
        }
       
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (LayerMaskUtility.Contains(layer,other.gameObject.layer))
        {
            _collider2Ds.Remove(other);
            if (triggered && _collider2Ds.Count == 0)
            {
                triggered = false;
                onTriggerExit?.Invoke();
            }
        }
        
    }
}